class EnquiriesController < Customer::BaseController

  # GET /enquiries
  # GET /enquiries.json
  def index
    @enquiries = current_customer.enquiries

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @enquiries }
    end
  end

  # GET /enquiries/1
  # GET /enquiries/1.json
  def show
    @enquiry = Enquiry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @enquiry }
    end
  end

  # GET /enquiries/new
  # GET /enquiries/new.json
  def pre_new
    @states_list = Location::State.all.map { |state| [state.name, state.code] }
    @regions_list = []
    @places_list = []

    @categories_root_list = ProductCategory.roots.map { |category| [category.name, category.id] }

    @enquiry = Enquiry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @enquiry }
    end
  end

  # GET /enquiries/new
  # GET /enquiries/new.json
  def new

    @categories_root_list = ProductCategory.roots.map { |category| [category.name, category.id] }

    product = Product.find(params[:product])
    @enquiry = product.enquiries.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @enquiry }
    end
  end

  def reply_details
    @reply = Reply.find(params[:reply_id])
    @enquiry = Enquiry.find(params[:id])
  end

  def choose_answer
    reply = Reply.find(params[:reply_id])
    reply.choice
    redirect_to customer_enquiry_path(reply.enquiry)
  end

  def reject_answer
    reply = Reply.find(params[:reply_id])
    reply.reject
    redirect_to customer_enquiry_path(reply.enquiry)
  end


  # GET /enquiries/1/edit
  def edit
    @enquiry = Enquiry.find(params[:id])
  end

  # POST /enquiries
  # POST /enquiries.json
  def create
    @enquiry = current_customer.enquiries.new(params[:enquiry])
    session[:enquiry] = params[:enquiry]
    respond_to do |format|
      if @enquiry.save
        format.html { redirect_to @enquiry, notice: 'Enquiry was successfully created.' }
        format.json { render json: @enquiry, status: :created, location: @enquiry }
      else
        format.html { render action: "new"}
        format.json { render json: @enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /enquiries
  # POST /enquiries.json
  def create_with_sign_up
    if customer_signed_in?
      @enquiry = current_customer.enquiries.new(params[:enquiry])
    else
      @enquiry = Enquiry.new(params[:enquiry])
    end
    respond_to do |format|
      if @enquiry.save
        #format.html { redirect_to root_path, notice: 'Enquiry was successfully created.' }
        format.json { render json: root_path, status: :created, location: @enquiry }
      else
        format.html { render action: "new", product: parames[:product] }
        format.json { render json: @enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enquiries/1
  # DELETE /enquiries/1.json
  def destroy
    @enquiry = Enquiry.find(params[:id])
    @enquiry.destroy

    respond_to do |format|
      format.html { redirect_to enquiries_url }
      format.json { head :no_content }
    end
  end
end