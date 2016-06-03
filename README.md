[![Code Climate](https://codeclimate.com/github/weteachme/instagram-hashtag/badges/gpa.svg)](https://codeclimate.com/github/weteachme/instagram-hashtag)
[![Test Coverage](https://codeclimate.com/github/weteachme/instagram-hashtag/badges/coverage.svg)](https://codeclimate.com/github/weteachme/instagram-hashtag/coverage)
[ ![Codeship Status for weteachme/instagram-hashtag](https://codeship.com/projects/8b5ce690-0ab8-0134-cd6a-223fae911045/status?branch=master)](https://codeship.com/projects/155640)
[![Issue Count](https://codeclimate.com/github/weteachme/instagram-hashtag/badges/issue_count.svg)](https://codeclimate.com/github/weteachme/instagram-hashtag)
# instagram-hashtag
A simple gem to crawl instagram hashtag page to get feeds. A workaround of the new API restriction as of 1 Jun, 2016.

## Usage

This is how you scrape data from Instagram hashtag page to get feeds.:

```
  require 'instagram_crawler/crawl'

  crawler = InstagramCrawler::Crawl.new(url: 'https://www.instagram.com/explore/tags/some_tag/')
  result = crawler.call
  puts result 
  
  # it will produce something like this
  # [{:image=>
  #     {:thumb=> "https://instagram.fmnl4-6.fna.fbcdn.net/t51.2885-15/s640x640/sh0.08/e35/123340_243412377842_448374947_n.jpg?ig_cache_key=MTIwNasHJshdh4MDYzOA%3D%3D.2",
  #       :url=> "https://instagram.fmnl4-6.fna.fbcdn.net/t51.2885-15/e35/12292540_243486385989842_448374947_n.jpg?ig_cache_key=MTIwNjAyNDI0MTDS2Q4MDYzOA%3D%3D.2"},
  #   :code=>"BC8qKhcRX5-",
  #   :caption=> "<U+1F381> Gift vouchers available.✏ BOOK or GIFT Espresso Basics - How to make coffee by @espressoschool at Clayton South VIC: j.mp/teachme887"
  #    }]
```
