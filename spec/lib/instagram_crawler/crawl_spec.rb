require 'spec_helper'

RSpec.describe InstagramCrawler::Crawl do
  describe '#call' do
    describe 'response check' do
      before(:each) do
        # decided to comment this to make real API test :) cheers!
        #allow(HTTParty).to receive(:get).and_return(get_file_string)
        @result = InstagramCrawler::Crawl.get_info_hash(hashtag: 'wtm_tes')
      end

      it 'should return a array of hash' do
        expect(@result).to be_instance_of(Array)
        @result.each do |item|
          expect(item).to be_instance_of(Hash)
        end
      end

      it 'should check for correct hash keys' do
        @result.each do |item|
          expect(item.key? :id).to eq true
          expect(item.key? :images).to eq true
          expect(item.key? :code).to eq true
          expect(item.key? :caption).to eq true
          expect(item.key? :created_time).to eq true
          expect(item.key? :link).to eq true
          expect(item.key? :likes).to eq true
          expect(item.key? :comments).to eq true

          expect(item[:images].has_key? :thumbnail).to eq true
          expect(item[:images][:thumbnail].has_key? :url).to eq true
          expect(item[:images].has_key? :standard_resolution).to eq true
          expect(item[:images][:standard_resolution].has_key? :url).to eq true
          expect(item[:likes].has_key? 'count').to eq true
          expect(item[:comments].has_key? 'count').to eq true
        end
      end
    end

    describe 'crawl username as well' do
      before(:each) do
        #allow(HTTParty).to receive(:get).and_return(get_file_string(is_user: true))
        @result = InstagramCrawler::Crawl.get_info_hash(hashtag: 'oldhaileyburians', is_user: true)
      end

      # Do a remote response
      it 'should accept username' do
        expect(@result).to be_instance_of(Array)
        @result.each do |item|
          expect(item).to be_instance_of(Hash)
        end
      end

      it 'should have images' do
        sample = @result.first
        expect(sample[:images][:thumbnail][:url]).not_to be_nil
        expect(sample[:images][:standard_resolution][:url]).not_to be_nil
      end

      it 'should check for correct hash keys' do
        @result.each do |item|
          expect(item.key? :id).to eq true
          expect(item.key? :images).to eq true
          expect(item.key? :code).to eq true
          expect(item.key? :caption).to eq true
          expect(item.key? :created_time).to eq true
          expect(item.key? :link).to eq true
          expect(item.key? :likes).to eq true
          expect(item.key? :comments).to eq true

          expect(item[:images].has_key? :thumbnail).to eq true
          expect(item[:images][:thumbnail].has_key? :url).to eq true
          expect(item[:images].has_key? :standard_resolution).to eq true
          expect(item[:images][:standard_resolution].has_key? :url).to eq true
          expect(item[:likes].has_key? 'count').to eq true
          expect(item[:comments].has_key? 'count').to eq true
        end
      end
    end

    it 'should output HTTP empty url when url is empty' do
      expect { InstagramCrawler::Crawl.get_info_hash }.to raise_error(ArgumentError)
    end

    it 'should pass empty_response as well' do
      allow(HTTParty).to receive(:get).and_return(get_empty_file_string)

      result = InstagramCrawler::Crawl.get_info_hash(hashtag: 'wtm_tes')
      expect(result).to be_instance_of(Array)
      expect(result.length).to eq 0
    end
  end
end
