class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :get_vendor
  
  def get_vendor
    @vendor = Vendor.find(params[:vendor_id])
  end

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = @vendor.invoices
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @invoice = @vendor.invoices.find(params[:id])
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    if(params[:id])
      @vendor = Vendor.find(params[:id])
      @invoice.vendor_id = @vendor.id
    end
    #get_ingredients
  end

  # GET /invoices/1/edit
  def edit
    #get_ingredients
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = @vendor.invoices.new(params[:invoice])
    @invoice.total = @invoice.total_price
    respond_to do |format|
      if @invoice.save
        format.html { redirect_to vendor_path(@invoice.vendor), method: :show, notice: "Invoice #{@invoice.number} was successfully created." }
        format.json { render action: 'show', status: :created, location: @invoice }
      else
        format.html { render action: 'new' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to vendor_path(@invoice.vendor), method: :show, notice: "Invoice #{@invoice.number} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to vendor_path(@invoice.vendor), method: :show, notice: "Invoice #{@invoice.number} was deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_ingredients
      if @invoice.invoice_ingredients.length == 0 
          @invoice.invoice_ingredients.build
          
      end
    end
    
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:number, :invoice_date, :vendor_id, invoice_ingredients_attributes: [:id, :quantity, :invoice_id, :ingredient_id, :measure_id, :price, :extended, :_destroy])
    end
    
    
end
