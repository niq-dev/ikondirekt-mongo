class ProfilesController < Customer::BaseController
  def show
    @page_title = "Your account details"
    @content_type = :sidebar_left
  end

  def edit
    @page_title = "Your profile details"
    @customer_user = current_customer_user
  end

  def update
    respond_to do |format|
      if current_customer_user.update_attributes(params[:customer_user])
        format.html { redirect_to customer_accounts_profiles_path(current_customer_user), notice: 'customer_user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer_user.errors, status: :unprocessable_entity }
      end
    end
  end
end
