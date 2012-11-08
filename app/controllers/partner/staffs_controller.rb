module Partner
  class StaffsController < BaseController
    load_and_authorize_resource

    add_crumb I18n.t(:staffs_managerment), :partner_staffs_path

    # GET /staffs
    # GET /staffs.json
    def index
      @page_title = t(:staffs_managerment)
      @staffs = Staff.all

      respond_to do |format|
        format.html # index.html.erb
        format.json do
          render(:json => @staffs.for_data_table(self, %w(name phone), %w(name phone)) do |staff|
            [
                staff.name,
                staff.phone,
                staff.fax,
                staff.email,
                "",
                #staff.branch.address.state.name,
                "",
                #staff.branch.address.place.name,
                "",
                #staff.branch.address.place.code
                "<%= link_to partner_staff_path(staff), :class => 'tablectrl_small bDefault tipS', 'original-title' => 'Show'  do %>" +
                  "<span class='iconb' data-icon='&#xe271;'></span>" +
                "<% end %>" +
                "<%= link_to edit_partner_staff_path(staff), :class => 'tablectrl_small bDefault tipS', 'original-title' => 'Show'  do %>" +
                  "<span class='iconb' data-icon='&#xe271;'></span>" +
                "<% end %>"
            ]
          end)
        end
      end
    end

    # GET /staffs/1
    # GET /staffs/1.json
    def show
      @staff = Staff.find(params[:id])

      add_crumb t(:staff_details), partner_staff_path(@staff)

      @page_title = t(:staff_details) + " - " + @staff.name

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @staff }
      end
    end

    # GET /staffs/new
    # GET /staffs/new.json
    def new
      @staff = Staff.new

      @page_title = t(:create_new_staff)

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @staff }
      end
    end

    # GET /staffs/1/edit
    def edit
      @page_title = t(:edit_staff_details)
      @staff = Staff.find(params[:id])
    end

    # POST /staffs
    # POST /staffs.json
    def create
      @staff = Staff.new(params[:staff])
      @staff.add_role :advisor

      respond_to do |format|
        if @staff.save
          format.html { redirect_to partner_staff_url(@staff), notice: 'Staff was successfully created.' }
          format.json { render json: @staff, status: :created, location: @staff }
        else
          format.html { render action: "new" }
          format.json { render json: @staff.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /staffs/1
    # PUT /staffs/1.json
    def update
      @staff = Staff.find(params[:id])

      respond_to do |format|
        if @staff.update_attributes(params[:staff])
          format.html { redirect_to @staff, notice: 'Staff was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @staff.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /staffs/1
    # DELETE /staffs/1.json
    def destroy
      @staff = Staff.find(params[:id])
      @staff.destroy

      respond_to do |format|
        format.html { redirect_to staffs_url }
        format.json { head :no_content }
      end
    end

    # GET /staffs/1/change_branch
    def change_branch

    end

  end
end