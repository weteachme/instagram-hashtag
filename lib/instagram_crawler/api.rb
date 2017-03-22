require 'httparty'

module InstagramCrawler
  class Api
    include HTTParty
    base_uri 'api.instagram.com/v1'

    def initialize(hashtag:, limit:)
      @hashtag = hashtag
      @limit = limit
    end

    def tags
      tag_data
    end

    private

    def self.access_token
      ::Rails.application.secrets.instagram_access_token
    rescue
      raise 'Missing Instagram Access Token'
    end

    def tag_data
      get_tags['data'].map do |tag|
        mapped_tag(tag)
      end
    end

    def get_tags
      self.class.get(
        "/tags/#{@hashtag}/media/recent?access_token=#{self.class.access_token}&limit=#{@limit}"
      ).parsed_response
    end

    def mapped_tag(tag)
      hash = {}
      hash[:id] = tag['id']
      hash[:images] = tag['images']
      hash[:code] = nil
      hash[:caption] = nil
      if tag['caption']
        hash[:caption] = tag['caption']['text']
        hash[:created_time] = tag['caption']['created_time']
      end
      hash[:link] = tag['link']
      hash[:likes] = tag['likes']
      hash[:comments] = tag['comments']
      hash
    end
  end
end
