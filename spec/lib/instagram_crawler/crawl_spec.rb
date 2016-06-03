require 'spec_helper'

RSpec.describe InstagramCrawler::Crawl do
  describe '#call' do
    it 'should return a array of hash' do
      allow(HTTParty).to receive(:get).and_return(get_file_string)

      result = InstagramCrawler::Crawl.get_info_hash(hashtag: 'wtm_tes')
      expect(result).to be_instance_of(Array)
      result.each do |item|
        expect(item).to be_instance_of(Hash)
      end
    end

    it 'should output HTTP empty url when url is empty' do
      expect { InstagramCrawler::Crawl.get_info_hash }.to raise_error(ArgumentError)
    end
  end
end
