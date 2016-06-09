require 'httparty'
require 'nokogiri'
require 'json'
require_relative 'json_parser'

module InstagramCrawler
  class Crawl
    extend InstagramCrawler::JSONParser

    DEFAULT_URL_PREFIX = 'https://www.instagram.com/explore/tags/'
    LINK_URL_PREFIX = 'http://instagr.am/p/'

    def self.get_info_hash(hashtag:, limit: 9)
      url = DEFAULT_URL_PREFIX + hashtag
      parse_page = get_and_parse(url)

      json = get_parsed_json(parse_page)

      data = json['entry_data']['TagPage'].first['tag']['media']['nodes'].first(limit)

      mapped_data = data.map do |post|
        get_hash_for_post(post)
      end

      mapped_data
    end

    protected
      class << self
        def get_hash_for_post(post)
          { id: post['id'],
            images: {
              thumbnail: {
                url: post['thumbnail_src']
              }, standard_resolution: { url: post['display_src'] }
            },
            code: post['code'], caption: post['caption'], created_time: post['date'], link: LINK_URL_PREFIX + post['code'] + '/',
            likes: post['likes'], comments: post['comments']}
        end
        def get_and_parse(url)
          Nokogiri::HTML HTTParty.get(url)
        end
      end
  end
end
