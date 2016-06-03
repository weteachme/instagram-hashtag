require 'httparty'
require 'nokogiri'
require 'json'
require_relative 'json_parser'

module InstagramCrawler
  class Crawl
    extend InstagramCrawler::JSONParser

    def self.get_info_hash(url: '', limit: 9)
      parse_page = get_and_parse(url)

      json = get_parsed_json(parse_page)

      data = json['entry_data']['TagPage'].first['tag']['media']['nodes'].first(limit)
      mapped_data = data.map{|post| { image: { thumb: post['thumbnail_src'], url: post['display_src'] }, code: post['code'], caption: post['caption'] } }

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
