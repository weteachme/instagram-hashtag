require 'rspec'
require 'instagram_crawler/crawl'
require 'codeclimate-test-reporter'
require_relative 'support/file_string'

CodeClimate::TestReporter.start

RSpec.configure do |config|
  config.include FileString
end
