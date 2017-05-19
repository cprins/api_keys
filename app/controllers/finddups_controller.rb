class FinddupsController < ApplicationController
  
  def new

  end
  
  def result
    @Find_duplicated = FindDuplicatedSentence.new
    @Find_duplicated.execute(params[:session][:sentence], params[:session][:apikey])
  end

end

private 

class FindDuplicatedSentence

  attr_accessor :wordposition, :code, :status 
  
  def initialize
    @wordposition = Hash.new
    @code  = "200"
    @status = "success"

  end
  
  def execute(sentence, api_key)
    api = Api.find_by(key: api_key)
    if api.nil?
      @code  = "401"
      @status = "unauthorized"
    else
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
        @wordposition[k] = position 
      end
    end
      
  end 
  
end
  