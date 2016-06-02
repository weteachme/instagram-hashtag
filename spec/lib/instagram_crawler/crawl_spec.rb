require 'rspec'
require 'instagram_crawler/crawl'

RSpec.describe InstagramCrawler::Crawl do
  describe '#call' do
    it 'should return a array of hash' do
      crawl = InstagramCrawler::Crawl.new(url: 'https://www.instagram.com/explore/tags/wtm_tes/')
      result = crawl.call
      expect(result).to be_instance_of(Array)
      result.each do |item|
        expect(item).to be_instance_of(Hash)
      end
    end

    it 'should output HTTP empty url when url is empty' do
      crawl = InstagramCrawler::Crawl.new
      result = crawl.call
      expect(result).to be_instance_of(String)
      expect(result).to eq 'HTTP request path is empty'
    end
  end
end
