class FinddupsController < ApplicationController
  
  def new

  end
  
  def result
  @wordposition =   FindDupsSentence(params[:session][:sentence])
  end

end

private 

def FindDupsSentence(frase)

  sentencearray = frase.split(" ")
  grouped_words = sentencearray.group_by { |x| x }
  counted = grouped_words.each_with_object({}) { |(k,v), hash| hash[k] = v.count}
  duplicated = counted.select { |k,v|  v > 1}
  wordposition = Hash.new
  duplicated.each do |k,v|  
    arraydup = sentencearray.map {|x| x == k } 
    position = []
    indi = 0
    arraydup.each do |bol|
      position << indi if bol
      indi = indi + 1
    end
    wordposition[k] = position 
  end
  wordposition
  
end   
  