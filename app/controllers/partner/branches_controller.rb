module Partner
  class BranchesController < BaseController
    load_and_authorize_resource

    # GET /branches
    # GET /branches.json
    def index

      @page_title = t(:branches_management)
      @sidebar_opts = {
          :widget => {
              1 => "location_filter"
          }
      }

      if params[:place_codes].present?
        @branches = @branches.in_places(params[:place_codes])
      elsif params[:region_code].present?
        @branches = @branches.in_region(params[:region_code])
      elsif params[:state_code].present?
        @branches = @branches.in_state(params[:state_code])
      end

      respond_to do |format|
        format.html # index.html.erb
        format.json do
          render(:json => @branches.for_data_table(self, %w(state place place_code phone fax), %w(state place place_code phone fax)) do |branch|
            [
                branch.address.state.name,
                branch.address.place.name,
                branch.address.place.code,
                branch.address.phone,
                branch.address.fax,
                branch.office_hours,
                "<%= link_to partner_branch_path(branch), :class => 'tablectrl_small bDefault tipS', 'original-title' => 'Show'  do %>" +
                  "<span class='iconb' data-icon='&#xe271;'></span>" +
                "<% end %>" +
                "<%= link_to edit_partner_branch_path(branch), :class => 'tablectrl_small bDefault tipS', 'original-title' => 'Show'  do %>" +
                  "<span class='iconb' data-icon='&#xe271;'></span>" +
                "<% end %>"
            ]
          end)
        end
      end
    end

    # GET /branches/1
    # GET /branches/1.json
    def show
      @branch = Branch.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @branch }
      end
    end

    # GET /branches/new
    # GET /branches/new.json
    def new
      @branch = current_staff.company.branches.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @branch }
      end
    end

    # GET /branches/1/edit
    def edit
      @branch = Branch.find(params[:id])
      @map_marker = Branch.all.to_gmaps4rails
    end

    # POST /branches
    # POST /branches.json
    def create
      @branch =current_staff.company.branches.new(params[:branch])

      respond_to do |format|
        if @branch.save
          format.html { redirect_to partner_branch_path(@branch), notice: 'Partner branch was successfully created.' }
          format.json { render json: @branch, status: :created, location: @branch }
        else
          format.html { render action: "new" }
          format.json { render json: @branch.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /branches/1
    # PUT /branches/1.json
    def update
      @branch = Branch.find(params[:id])

      respond_to do |format|
        if @branch.update_attributes(params[:branch])
          format.html { redirect_to partner_branch_path(@branch), notice: 'Partner branch was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @branch.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /branches/1
    # DELETE /branches/1.json
    def destroy
      @branch = Branch.find(params[:id])
      @branch.destroy

      respond_to do |format|
        format.html { redirect_to partner_branches_url }
        format.json { head :no_content }
      end
    end
  end
end
