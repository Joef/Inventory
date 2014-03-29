class InvoiceIngredientsController < ApplicationController
  before_action :set_invoice_ingredient, only: [:show, :edit, :update, :destroy]
  

  # GET /invoice_ingredients
  # GET /invoice_ingredients.json
  def index
    @invoice_ingredients = InvoiceIngredient.all
  end

  # GET /invoice_ingredients/1
  # GET /invoice_ingredients/1.json
  def show
  end

  # GET /invoice_ingredients/new
  def new
    @invoice_ingredient = InvoiceIngredient.new
  end

  # GET /invoice_ingredients/1/edit
  def edit
  end

  # POST /invoice_ingredients
  # POST /invoice_ingredients.json
  def create
    @invoice_ingredient = InvoiceIngredient.new(invoice_ingredient_params)

    respond_to do |format|
      if @invoice_ingredient.save
        format.html { redirect_to @invoice_ingredient, notice: 'Invoice ingredient was successfully created.' }
        format.json { render action: 'show', status: :created, location: @invoice_ingredient }
      else
        format.html { render action: 'new' }
        format.json { render json: @invoice_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_ingredients/1
  # PATCH/PUT /invoice_ingredients/1.json
  def update
    respond_to do |format|
      if @invoice_ingredient.update(invoice_ingredient_params)
        format.html { redirect_to @invoice_ingredient, notice: 'Invoice ingredient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invoice_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_ingredients/1
  # DELETE /invoice_ingredients/1.json
  def destroy
    @invoice_ingredient.destroy
    respond_to do |format|
      format.html { redirect_to invoice_ingredients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_ingredient
      @invoice_ingredient = InvoiceIngredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_ingredient_params
      params.require(:invoice_ingredient).permit(:invoice_id, :ingredient_id, :measure_id, :quantity_ordered, :quantity_shipped, :price, :extended, :brand, :item_number, :vendor_number, :description, :unit, :pack )
    end
end
