class SendWaysController < ApplicationController
  before_action :set_send_way, only: [:show, :edit, :update, :destroy]

  # GET /send_ways
  # GET /send_ways.json
  def index
    @send_ways = SendWay.all
  end

  # GET /send_ways/1
  # GET /send_ways/1.json
  def show
  end

  # GET /send_ways/new
  def new
    @send_way = SendWay.new
  end

  # GET /send_ways/1/edit
  def edit
  end

  # POST /send_ways
  # POST /send_ways.json
  def create
    @send_way = SendWay.new(send_way_params)

    respond_to do |format|
      if @send_way.save
        format.html { redirect_to @send_way, notice: 'Send way was successfully created.' }
        format.json { render :show, status: :created, location: @send_way }
      else
        format.html { render :new }
        format.json { render json: @send_way.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /send_ways/1
  # PATCH/PUT /send_ways/1.json
  def update
    respond_to do |format|
      if @send_way.update(send_way_params)
        format.html { redirect_to @send_way, notice: 'Send way was successfully updated.' }
        format.json { render :show, status: :ok, location: @send_way }
      else
        format.html { render :edit }
        format.json { render json: @send_way.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /send_ways/1
  # DELETE /send_ways/1.json
  def destroy
    @send_way.destroy
    respond_to do |format|
      format.html { redirect_to send_ways_url, notice: 'Send way was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_send_way
      @send_way = SendWay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def send_way_params
      params.require(:send_way).permit(:name, :good_id, :how_many_days, :price)
    end
end
