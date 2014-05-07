class VendorsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  # GET /vendors
  # GET /vendors.json
  def index
    @vendors = Vendor.order(params[:sort])
  end

  # GET /vendors/1
  # GET /vendors/1.json
  def show
    @this_year = Time.now.year
    @last_year = @this_year - 1
    
    @years = (@this_year).downto(@this_year-3).collect{|p| ["#{p}", p]}
    
    @invoices = @vendor.invoices.order(sort_column + ' ' + sort_direction)
    
    letter = params[:letter]? params[:letter] : "A"
     
    #select * from (select distinct on (invoice_ingredients.ingredient_id) name, last_price from invoice_ingredients 
    #JOIN ingredients ON ingredients.id = invoice_ingredients.ingredient_id 
    #JOIN invoices ON invoices.id = invoice_ingredients.invoice_id WHERE vendor_id = 1) AS distinct_selected;
    @products  = InvoiceIngredient.select("distinct on (invoice_ingredients.ingredient_id) name, last_price, invoice_ingredients.measure_id, invoice_ingredients.ingredient_id").
              joins(:ingredient).
              joins(:invoice).
              includes(:measure).
              where(["invoices.vendor_id = ?", params[:id]])
              
    
    @letters = Array.new 
    @products.each do |i|
      l = i.name[0]
      if @letters.length == 0 || !(@letters.include? l)
        @letters.push(l)
      end
    end
    @letters.sort! 
    @products = @products.
    where(["ingredients.name LIKE ?", "#{letter}%"])
    
  end

  # GET /vendors/new
  def new
    @vendor = Vendor.new
  end

  # GET /vendors/1/edit
  def edit
  end

  # POST /vendors
  # POST /vendors.json
  def create
    @vendor = Vendor.new(vendor_params)

    respond_to do |format|
      if @vendor.save
        format.html { redirect_to vendor_path(@vendor), notice: 'Vendor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vendor }
      else
        format.html { render action: 'new' }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendors/1
  # PATCH/PUT /vendors/1.json
  def update
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to vendor_path(@vendor), notice: "Vendor #{@vendor.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1
  # DELETE /vendors/1.json
  def destroy
    @vendor.destroy
    respond_to do |format|
      format.html { redirect_to vendors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end
    
    def sort_column
      Invoice.column_names.include?(params[:sort]) ? params[:sort] : "invoice_date"
    end
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_params
      params.require(:vendor).permit(:name, :address_1, :address_2, :address_city, :address_state, :address_postal_code, :vendor_type_id,
        invoice: [:id, :number, :invoice_date, :vendor_id])
      
    end
end
