class KeywordGenerator
   attr_accessor :keywords, :article

   def initialize
      @article = get_keyword_article
      @keywords = generate_keywords
   end

   def generate_keywords
      article_words = self.article
      BAD_CHARACTERS.each do |char|
        article_words = article_words.gsub(char, "")
      end

      word_array = article_words.downcase.split(" ").uniq
      word_array.map{|x| x.gsub(/[^0-9A-Za-z]/, '') }

      RESERVER_WORDS.each do |word|
        word_array.delete(word)
      end
      return word_array.sort_by{ |x| x }
   end

   private

   def get_keyword_article
     article = JSON.load(IO.read("data/keyword_article.json"))
     article["body"]
   end
end

