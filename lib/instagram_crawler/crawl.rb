require 'httparty'
require 'nokogiri'
require 'json'
require_relative 'json_parser'

module InstagramCrawler
  class Crawl
    extend InstagramCrawler::JSONParser

    DEFAULT_URL = 'https://www.instagram.com/explore/tags/'

    def self.get_info_hash(hashtag:, limit: 9)
      url = DEFAULT_URL + hashtag
      parse_page = get_and_parse(url)

      json = get_parsed_json(parse_page)

      data = json['entry_data']['TagPage'].first['tag']['media']['nodes'].first(limit)
      mapped_data = data.map{|post| { image: { thumb: post['thumbnail_src'], url: post['display_src'] }, code: post['code'], caption: post['caption'], date: post['date'] } }

      mapped_data
    end

    protected
      class << self
        def get_and_parse(url)
          Nokogiri::HTML HTTParty.get(url)
        end
      end
  end
end
