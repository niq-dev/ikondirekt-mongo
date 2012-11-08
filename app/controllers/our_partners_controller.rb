class OurPartnersController < Customer::BaseController
  # GET /our_partners
  # GET /our_partners.json
  def index
    @our_partners = OurPartner.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @our_partners }
    end
  end

  # GET /our_partners/1
  # GET /our_partners/1.json
  def show
    @our_partner = OurPartner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @our_partner }
    end
  end

  # GET /our_partners/new
  # GET /our_partners/new.json
  def new
    @our_partner = OurPartner.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @our_partner }
    end
  end

  # GET /our_partners/1/edit
  def edit
    @our_partner = OurPartner.find(params[:id])
  end

  # POST /our_partners
  # POST /our_partners.json
  def create
    @our_partner = OurPartner.new(params[:our_partner])

    respond_to do |format|
      if @our_partner.save
        format.html { redirect_to @our_partner, notice: 'Our partner was successfully created.' }
        format.json { render json: @our_partner, status: :created, location: @our_partner }
      else
        format.html { render action: "new" }
        format.json { render json: @our_partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /our_partners/1
  # PUT /our_partners/1.json
  def update
    @our_partner = OurPartner.find(params[:id])

    respond_to do |format|
      if @our_partner.update_attributes(params[:our_partner])
        format.html { redirect_to @our_partner, notice: 'Our partner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @our_partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /our_partners/1
  # DELETE /our_partners/1.json
  def destroy
    @our_partner = OurPartner.find(params[:id])
    @our_partner.destroy

    respond_to do |format|
      format.html { redirect_to our_partners_url }
      format.json { head :no_content }
    end
  end
end
