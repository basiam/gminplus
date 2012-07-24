class CommunesController < ApplicationController

  def index
    @communes = Commune.search(params[:query])
    render :json => @communes.to_json
  end

end
