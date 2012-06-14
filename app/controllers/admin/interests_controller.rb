class Admin::InterestsController < CmsAdmin::BaseController
  respond_to :html, :json

  def index
    respond_with(@interests = Interest.all)
  end

  def show
    @interest = Interest.find(params[:id])
    respond_with(@interest)
  end

  def edit
    @interest = Interest.find(params[:id])
  end

  def update
    @interest = Interest.find(params[:id])

    respond_to do |format|
      if @interest.update_attributes(params[:interest])
        format.html { redirect_to @interest, notice: 'Interest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy

    respond_to do |format|
      format.html { redirect_to admin_interests_url }
      format.json { head :no_content }
    end
  end
end
