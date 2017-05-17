class ApisController < ApplicationController
  def index
    @apis = Api.all
  end
  
  def new
    @api = Api.new
  end
  
  def create
    @api = Api.new(api_params)
    @api.key =  generar_key
    if @api.save
      flash[:success] = "El API KEY fue creado satisfactoriamente"
      redirect_to root_path
    else
      render 'new'
    end
    
  end

end

private

def api_params
  params.require(:api).permit(:email)
end

def generar_key
  require 'digest/md5'
  Digest::MD5.hexdigest(@api.email)
end
