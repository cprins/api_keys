class FindDuplicatedWords

  attr_accessor :word_position, :code, :status 
  
  def initialize
    @word_position = Hash.new

  end
  
  def call(sentence)
    sentencearray = sentence.split(" ")
    grouped_words = sentencearray.group_by { |x| x }
    counted = grouped_words.each_with_object({}) { |(k,v), hash| hash[k] = v.count}
    duplicated = counted.select { |k,v|  v > 1}
    duplicated.each do |k,v|  
      arraydup = sentencearray.map {|x| x == k } 
      position = []
      indi = 0
      arraydup.each do |bol|
        position << indi if bol
        indi = indi + 1
      end
      @word_position[k] = position 
    end
  end
end

                        
