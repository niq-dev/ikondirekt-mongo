module Partner
  class EnquiriesController < BaseController
    #load_and_authorize_resource :class => "Reply"

    # GET /replies
    # GET /replies.json
    def index
      if current_staff.has_role? :manager
        @replies = current_staff.company.replies.all
      else
        @replies = current_staff.replies.all
      end
      @page_title = t(:enquiries_process)

      respond_to do |format|
        format.html # index.html.erb
        format.json do
          render(:json => @replies.for_data_table(self, %w(create_at state place_code place product), %w(create_at state place_code place product)) do |reply|
            [
                reply.enquiry.created_at.to_formatted_s(:short),
                reply.enquiry.product.name,
                reply.status,
                reply.enquiry.state.name,
                reply.enquiry.place.code,
                reply.enquiry.place.name,
                "<%= link_to partner_enquiry_path(reply), :class => 'tablectrl_small bDefault tipS', 'original-title' => 'Show'  do %>"+
                  "<span class='iconb' data-icon='&#xe044;'></span>"+
                "<% end %>"+
                "<%- if reply.assigned? %>"+
                  "<%= link_to answer_partner_enquiry_path(reply), :class => 'tablectrl_small bDefault tipS', 'original-title' => 'answer'  do %>"+
                    "<span class='iconb' data-icon='&#xe003;'></span>"+
                  "<% end %>"+
                "<% end %>"+
                "<%- if reply.created? %>"+
                    "<%= link_to assign_partner_enquiry_path(reply), :class => 'tablectrl_small bDefault tipS', 'original-title' => 'assign'  do %>"+
                      "<span class='iconb' data-icon='&#xe21c;'></span>"+
                    "<% end %>"+
                "<% end %>"
            ]
          end)
        end
      end
    end

    # GET / replies/1
    # GET /replies/1.json
    def show
      @reply = Reply.find(params[:id])
      @enquiry = @reply.enquiry
      @enquiry_circle = [{:lng => @enquiry.longitude, :lat => @enquiry.latitude,:radius => 500}].to_json

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @reply }
      end
    end

    def assign
      @states_list = Location::State.all.map { |state| [state.name, state.code] }
      @regions_list = []
      @places_list = []
      if params[:region_code].present?
        @places_list = Location::Place.where(:region_code => params[:region_code]).map { |place| [place.name, place.code] }
        @regions_list = Location::Region.where(:code => params[:region_code]).map { |region| [region.name, region.code] }
      elsif params[:state_code]
        @regions_list = Location::Region.where(:state_code => params[:state_code]).map { |region| [region.name, region.code] }
      end
      @reply = Reply.find(params[:id])
      @enquiry = @reply.enquiry
      @enquiry_circle = [{:lng => @enquiry.longitude, :lat => @enquiry.latitude,:radius => 500}].to_json
    end

    def branches_to_assign
      if params[:place_codes].present?
        @branches = current_staff.company.branches.in_places(params[:place_codes])
      end
      #@reply = Reply.find(params[:id])
      respond_to do |format|
        format.js
      end
    end

    def staffs_to_assign
      if params[:branch_id].present?
        @staffs = current_staff.company.branches.find(params[:branch_id]).staffs
      end
      respond_to do |format|
        format.js
      end
    end

    def submit_assign
      advisor = Staff.find(params[:staff_id])
      reply = Reply.find(params[:id])
      reply.assign_advisor(advisor)

      if reply.assigned? && reply.advisor == advisor
        redirect_to partner_enquiries_path, notice: 'Successfully assigned.'
      else
        render :nothing => true
      end
    end

    def answer
      @reply = Reply.find(params[:id])
      @enquiry = @reply.enquiry
      @enquiry_circle = [{:lng => @enquiry.longitude, :lat => @enquiry.latitude,:radius => 500}].to_json
    end

    def save_answer
      @reply = Reply.find(params[:id])
      respond_to do |format|
        if @reply.update_attributes(params[:reply])
          @reply.answer
          format.html { redirect_to partner_enquiry_path(@reply), notice: 'Reply was successfully saved.' }
          format.json { head :no_content }
        else
          format.html { render action: "answer" }
          format.json { render json: @reply.errors, status: :unprocessable_entity }
        end
      end
    end

    # GET /replies/new
    # GET /replies/new.json
    def new
      @reply = Reply.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @reply }
      end
    end

    # GET /replies/1/edit
    def edit
      @reply = Reply.find(params[:id])
      @enquiry = @reply.enquiry
      #@enquiry_circle = @enquiry.customer.to_gmaps4rails
      @enquiry_circle = [{:lng => @enquiry.longitude, :lat => @enquiry.latitude,:radius => 500}].to_json
    end

    # POST /replies
    # POST /replies.json
    def create
      @reply = Reply.new(params[:reply])

      respond_to do |format|
        if @reply.save
          format.html { redirect_to @reply, notice: 'Reply was successfully created.' }
          format.json { render json: @reply, status: :created, location: @reply }
        else
          format.html { render action: "new" }
          format.json { render json: @reply.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /replies/1
    # PUT /replies/1.json
    def update
      @reply = Reply.find(params[:id])

      respond_to do |format|
        if @reply.update_attributes(params[:reply])
          format.html { redirect_to @reply, notice: 'Reply was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @reply.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /replies/1
    # DELETE /replies/1.json
    def destroy
      @reply = Reply.find(params[:id])
      @reply.destroy

      respond_to do |format|
        format.html { redirect_to replies_url }
        format.json { head :no_content }
      end
    end
  end
end