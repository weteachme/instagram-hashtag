require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
require 'rspec'
require 'instagram_crawler/crawl'
require_relative 'support/file_string'

RSpec.configure do |config|
  config.include FileString
end
