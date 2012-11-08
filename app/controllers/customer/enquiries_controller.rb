  class Customer::EnquiriesController < Customer::BaseController
    # GET /enquiries
    # GET /enquiries.json
    def pre_new_products_list
      @cat_roots = ProductCategory.roots
    end

    def index
      @enquiries = Enquiry.all

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

    def reply_details
      @reply = Reply.find(params[:reply_id])
      @enquiry = Enquiry.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.js
      end
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

    # GET /enquiries/new
    # GET /enquiries/new.json
    def new
      product = Product.find(params[:product])
      @enquiry = product.enquiries.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @enquiry }
      end
    end

    # GET /enquiries/1/edit
    def edit
      @enquiry = Enquiry.find(params[:id])
    end

    # POST /enquiries
    # POST /enquiries.json
    def create
      @enquiry = current_user.enquiries.new(params[:enquiry])

      respond_to do |format|
        if @enquiry.save
          format.html { redirect_to customer_enquiries_path, notice: 'Enquiry was successfully created.' }
          format.json { render json: customer_enquiries_path, status: :created, location: @enquiry }
        else
          format.html { render action: "new" }
          format.json { render json: @enquiry.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /enquiries/1
    # PUT /enquiries/1.json
    def update
      @enquiry = Enquiry.find(params[:id])

      respond_to do |format|
        if @enquiry.update_attributes(params[:enquiry])
          format.html { redirect_to @enquiry, notice: 'Enquiry was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
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

    def get_category
      respond_to do |format|
        format.html
        format.js
      end
    end
  end
