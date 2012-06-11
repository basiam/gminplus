class InterestsController < ApplicationController
  respond_to :html, :json

  def new
    @interest = Interest.new
  end

  def create
    @interest = Interest.new(params[:interest])
    @interest.ip = request.remote_ip

    if @interest.save
      render json: @interest
    else
      render json: @interest.errors, status: :unprocessable_entity 
    end
  end
end
