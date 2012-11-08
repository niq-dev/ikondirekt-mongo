class SupportZonesController < Customer::BaseController
  # GET /support_zones
  # GET /support_zones.json
  def index
    @support_zones = SupportZone.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @support_zones }
    end
  end

  # GET /support_zones/1
  # GET /support_zones/1.json
  def show
    @support_zone = SupportZone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @support_zone }
    end
  end

  # GET /support_zones/new
  # GET /support_zones/new.json
  def new
    @support_zone = SupportZone.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @support_zone }
    end
  end

  # GET /support_zones/1/edit
  def edit
    @support_zone = SupportZone.find(params[:id])
  end

  # POST /support_zones
  # POST /support_zones.json
  def create
    @support_zone = SupportZone.new(params[:support_zone])

    respond_to do |format|
      if @support_zone.save
        format.html { redirect_to @support_zone, notice: 'Support zone was successfully created.' }
        format.json { render json: @support_zone, status: :created, location: @support_zone }
      else
        format.html { render action: "new" }
        format.json { render json: @support_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /support_zones/1
  # PUT /support_zones/1.json
  def update
    @support_zone = SupportZone.find(params[:id])

    respond_to do |format|
      if @support_zone.update_attributes(params[:support_zone])
        format.html { redirect_to @support_zone, notice: 'Support zone was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @support_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /support_zones/1
  # DELETE /support_zones/1.json
  def destroy
    @support_zone = SupportZone.find(params[:id])
    @support_zone.destroy

    respond_to do |format|
      format.html { redirect_to support_zones_url }
      format.json { head :no_content }
    end
  end
end
