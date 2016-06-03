require 'httparty'
require 'nokogiri'
require 'json'

module InstagramCrawler
  class Crawl
    def self.get_info_hash(url: '', limit: 9)
      page = HTTParty.get(url)
      parse_page = Nokogiri::HTML(page)

      json_matcher = 'window._sharedData = '
      sibling = parse_page.css('#react-root').last

      begin
        sibling = sibling.next_element
      end while sibling.text.empty? && !(sibling.text =~ /#{json_matcher}/)

      inline_text = sibling.text

      unparse_json = inline_text.split(/#{json_matcher}/).last.chomp(';')
      json =  JSON.parse(unparse_json)

      data = json['entry_data']['TagPage'].first['tag']['media']['nodes'].first(limit)
      mapped_data = data.map{|post| { image: { thumb: post['thumbnail_src'], url: post['display_src'] }, code: post['code'], caption: post['caption'] } }

      mapped_data
    end
  end
end
