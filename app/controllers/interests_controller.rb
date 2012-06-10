class InterestsController < ApplicationController
  respond_to :html, :json

  def new
    @interest = Interest.new
  end

  def create
    @interest = Interest.new(params[:interest])
    puts request.inspect
    @interest.ip = request.remote_ip

    respond_to do |format|
      if @interest.save
        redirect_to "/" and return
      else
        format.html { render action: "new" }
        format.json { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end
end
