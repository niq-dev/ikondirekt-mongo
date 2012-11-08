module Partner
  module Account
    class ProfileController < BaseController
      before_filter :authenticate_staff!

      add_crumb I18n.t(:my_profile), :edit_partner_account_profile_path
      # GET partner/account/profile/:id/edit
      def edit
        @page_title = t(:my_profile)
        @profile = current_staff
      end

      # PUT partner/account/profile/1.json
      def update
        @profile = current_staff

        respond_to do |format|
          if @profile.update_attributes(params[:profile])
            format.html { redirect_to partner_branch_path(@branch), notice: 'Partner branch was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: "edit" }
            format.json { render json: @branch.errors, status: :unprocessable_entity }
          end
        end
      end

    end
  end
end
