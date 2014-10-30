
require 'json'

require_relative 'config/constants'
require_relative 'lib/keyword_generator'
require_relative 'lib/article'

articles = []
json_articles = JSON.load(IO.read("data/articles.json"))
json_articles["articles"].each do |art|
  articles << Article.new(art["title"], art["body"])
end

articles.each do |a|
  puts "--------- " + a.title + " ---------------"
  p a.get_procentage
end

