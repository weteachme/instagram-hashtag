require 'spec_helper'

RSpec.describe InstagramCrawler::Api do
  describe '#tags' do
    let(:result) { InstagramCrawler::Api.new(hashtag: hashtag, limit: limit).tags }
    let(:hashtag) { 'love' }
    let(:limit) { 9 }
    let(:response) { double }
    let(:stubbed_response) do
      {
        "data": [{
          "type": "image",
          "users_in_photo": [],
          "filter": "Earlybird",
          "tags": ["snow"],
          "comments": {
          "count": 3
        },
        "caption": {
          "created_time": "1296703540",
          "text": "#Snow",
          "from": {
          "username": "emohatch",
          "id": "1242695"
        },
        "id": "26589964"
        },
        "likes": {
          "count": 1
        },
        "link": "http://instagr.am/p/BWl6P/",
        "user": {
          "username": "emohatch",
          "profile_picture": "http://distillery.s3.amazonaws.com/profiles/profile_1242695_75sq_1293915800.jpg",
          "id": "1242695",
          "full_name": "Dave"
        },
        "created_time": "1296703536",
        "images": {
          "low_resolution": {
            "url": "http://distillery.s3.amazonaws.com/media/2011/02/02/f9443f3443484c40b4792fa7c76214d5_6.jpg",
            "width": 306,
            "height": 306
          },
          "thumbnail": {
            "url": "http://distillery.s3.amazonaws.com/media/2011/02/02/f9443f3443484c40b4792fa7c76214d5_5.jpg",
            "width": 150,
            "height": 150
          },
          "standard_resolution": {
            "url": "http://distillery.s3.amazonaws.com/media/2011/02/02/f9443f3443484c40b4792fa7c76214d5_7.jpg",
            "width": 612,
            "height": 612
          }
        },
        "id": "22699663",
        "location": nil
        },
        {
          "type": "video",
          "videos": {
          "low_resolution": {
            "url": "http://distilleryvesper9-13.ak.instagram.com/090d06dad9cd11e2aa0912313817975d_102.mp4",
            "width": 480,
            "height": 480
          },
          "standard_resolution": {
            "url": "http://distilleryvesper9-13.ak.instagram.com/090d06dad9cd11e2aa0912313817975d_101.mp4",
            "width": 640,
            "height": 640
          },
          "users_in_photo": nil,
          "filter": "Vesper",
          "tags": ["snow"],
          "comments": {
            "count": 2
          },
          "caption": {
            "created_time": "1296703540",
            "text": "#Snow",
            "from": {
            "username": "emohatch",
            "id": "1242695"
          },
          "id": "26589964"
          },
          "likes": {
            "count": 1
          },
          "link": "http://instagr.am/p/D/",
          "user": {
            "username": "kevin",
            "full_name": "Kevin S",
            "profile_picture": "...",
            "id": "3"
          },
          "created_time": "1279340983",
          "images": {
            "low_resolution": {
              "url": "http://distilleryimage2.ak.instagram.com/11f75f1cd9cc11e2a0fd22000aa8039a_6.jpg",
              "width": 306,
              "height": 306
            },
            "thumbnail": {
              "url": "http://distilleryimage2.ak.instagram.com/11f75f1cd9cc11e2a0fd22000aa8039a_5.jpg",
              "width": 150,
              "height": 150
            },
            "standard_resolution": {
              "url": "http://distilleryimage2.ak.instagram.com/11f75f1cd9cc11e2a0fd22000aa8039a_7.jpg",
              "width": 612,
              "height": 612
            }
          },
          "id": "3",
          "location": nil
        }
        }]
      }.to_json
    end

    before(:each) do
      allow(response).to receive(:parsed_response).and_return(JSON.parse(stubbed_response))
      allow(InstagramCrawler::Api).to receive(:access_token).and_return('sometoken')
      allow(InstagramCrawler::Api).to receive(:get).and_return(response)
    end

    it { expect(result).to eq([{:id=>"22699663", :images=>{"low_resolution"=>{"url"=>"http://distillery.s3.amazonaws.com/media/2011/02/02/f9443f3443484c40b4792fa7c76214d5_6.jpg", "width"=>306, "height"=>306}, "thumbnail"=>{"url"=>"http://distillery.s3.amazonaws.com/media/2011/02/02/f9443f3443484c40b4792fa7c76214d5_5.jpg", "width"=>150, "height"=>150}, "standard_resolution"=>{"url"=>"http://distillery.s3.amazonaws.com/media/2011/02/02/f9443f3443484c40b4792fa7c76214d5_7.jpg", "width"=>612, "height"=>612}}, :code=>nil, :caption=>"#Snow", :created_time=>"1296703540", :link=>"http://instagr.am/p/BWl6P/", :likes=>{"count"=>1}, :comments=>{"count"=>3}}, {:id=>nil, :images=>nil, :code=>nil, :caption=>nil, :link=>nil, :likes=>nil, :comments=>nil}]) }
  end
end
