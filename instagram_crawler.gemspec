$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "instagram_crawler/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "instagram_crawler"
  s.version     = InstagramCrawler::VERSION
  s.authors     = ["Charles Darwin Pobre"]
  s.email       = ["cpobre.peg@gmail.com"]
  s.homepage    = "http://todo.com"
  s.summary     = "Scrape Instagram Posts"
  s.description = "Scrape Instagram Posts and more"
  s.license     = "MIT"

  s.files = Dir["{lib}/**/*.rb", "LICENSE", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_runtime_dependency 'nokogiri'
  s.add_runtime_dependency 'httparty'

  s.add_development_dependency "rspec"
end
