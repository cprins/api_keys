class FinddupsController < ApplicationController
  
  def new

  end
  
  def result
    if api_key
      @duplicated_words = FindDuplicatedWords.new
      @duplicated_words.call(params[:session][:sentence])
      @status = "success"
      @code = "200"
      Api.update_request(@api_key)
    else
      @status = "unauthorized"
      @code = "401"
    end
  end
end


private

  def api_key
    @api_key ||= Api.find_by_key(params[:session][:apikey])
  end


  