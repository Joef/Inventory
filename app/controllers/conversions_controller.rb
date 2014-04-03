class ConversionsController < ApplicationController
  before_action :set_conversion, only: [:show, :edit, :update, :destroy]
  
  before_action :get_measure
  
  def get_measure
    @measure = Measure.find(params[:measure_id]) 
  end

  # GET /conversions
  # GET /conversions.json
  def index
    if params[:to_id]
      @conversions = @measure.conversions.where(measure_b_id: params[:to_id])
      #if conversions.empty?
      #try to find a path for the conversion
    else
      @conversions = @measure.conversions
    end
  end

  # GET /conversions/1
  # GET /conversions/1.json
  def show
  end

  # GET /conversions/new
  def new
    @conversion = @measure.conversions.new
    @conversion.measure_a_id = @measure.id
    
  end

  # GET /conversions/1/edit
  def edit
  end

  # POST /conversions
  # POST /conversions.json
  def create
    @conversion = @measure.conversions.new(conversion_params)
    
    
    respond_to do |format|
      if @conversion.save
        format.html { redirect_to measures_path, notice: "Updated conversion: '#{@conversion.measure_a.name} >  #{@conversion.measure_b.name}'" }
        format.json { render action: 'show', status: :created, location: @conversion }
      else
        format.html { render action: 'new' }
        format.json { render json: @conversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversions/1
  # PATCH/PUT /conversions/1.json
  def update
    respond_to do |format|
      if @conversion.update(conversion_params)
        format.html { redirect_to measures_path, notice: "Updated conversion: '#{@conversion.measure_a.name} >  #{@conversion.measure_b.name}'" }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @conversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversions/1
  # DELETE /conversions/1.json
  def destroy
    @conversion.destroy
    respond_to do |format|
      format.html { redirect_to measures_path, notice: "Deleted conversion: '#{@conversion.measure_a.name} >  #{@conversion.measure_b.name}'" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversion
      @conversion = Conversion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversion_params
      params.require(:conversion).permit(:measure_a_id, :measure_b_id, :quantity)
    end
end
