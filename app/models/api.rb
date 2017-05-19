class Api < ActiveRecord::Base
    
  validates   :email, presence: true, 
              uniqueness: {case_sensitive: false} 
    
  def self.update_request(api)
    api.number_request = api.number_request + 1
    api.save
  end
  
end