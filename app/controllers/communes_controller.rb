class CommunesController < ApplicationController
  respond_to :json, :html

  def index
    @communes = Commune.search(params[:query])
    respond_with  @communes
  end

end
