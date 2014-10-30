class Article
   attr_accessor :title, :body, :array_rep, :keywords

   def initialize(title, body)
      @title = title
      @body = body
      @keywords = KeywordGenerator.new().keywords
   end
        
   def get_procentage
      self.body_to_array
      self.array_rep.inject(:+).to_f / self.keywords.count.to_f
   end

   def get_keyowrd_count
      self.keywords.count
   end

   def body_to_array
      text = self.body
      BAD_CHARACTERS.each do |char|
        text = text.gsub(char, "")
      end

      array_repre = text.downcase.split(" ").uniq
      RESERVER_WORDS.each do |word|
        array_repre.delete(word)
      end

      array_repre.map{ |x| x.gsub(/[^0-9A-Za-z]/, '') }

      result = []
      self.keywords.each do |word|
        if array_repre.include? word
           result << 1
        else
           result << 0
        end
      end
      self.array_rep = result
   end

end
