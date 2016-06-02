require 'HTTParty'
require 'Nokogiri'
require 'JSON'

module InstagramCrawler
  class Crawl
    def initialize(url: '', limit: 9)
      @url = url
      @limit = limit
    end

    attr_reader :url, :limit

    def call
      page = HTTParty.get(@url)
      parse_page = Nokogiri::HTML(page)
      inline = parse_page.xpath('/html/body/script[3]').last.text

      unparse_json = inline.split(/window._sharedData = /).last.chomp(';')
      json =  JSON.parse(unparse_json)

      data = json['entry_data']['TagPage'].first['tag']['media']['nodes'].first(@limit)
      mapped_data = data.map{|post| { image: { thumb: post['thumbnail_src'], url: post['display_src'] }, code: post['code'], caption: post['caption'] } }

      mapped_data
    rescue => e
      puts e.message
      e.message
    end
  end
end
