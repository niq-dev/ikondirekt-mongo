class HowsController < Customer::BaseController
  # GET /hows
  # GET /hows.json
  def index
    @hows = How.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hows }
    end
  end

  # GET /hows/1
  # GET /hows/1.json
  def show
    @how = How.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @how }
    end
  end

  # GET /hows/new
  # GET /hows/new.json
  def new
    @how = How.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @how }
    end
  end

  # GET /hows/1/edit
  def edit
    @how = How.find(params[:id])
  end

  # POST /hows
  # POST /hows.json
  def create
    @how = How.new(params[:how])

    respond_to do |format|
      if @how.save
        format.html { redirect_to @how, notice: 'How was successfully created.' }
        format.json { render json: @how, status: :created, location: @how }
      else
        format.html { render action: "new" }
        format.json { render json: @how.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hows/1
  # PUT /hows/1.json
  def update
    @how = How.find(params[:id])

    respond_to do |format|
      if @how.update_attributes(params[:how])
        format.html { redirect_to @how, notice: 'How was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @how.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hows/1
  # DELETE /hows/1.json
  def destroy
    @how = How.find(params[:id])
    @how.destroy

    respond_to do |format|
      format.html { redirect_to hows_url }
      format.json { head :no_content }
    end
  end
end
