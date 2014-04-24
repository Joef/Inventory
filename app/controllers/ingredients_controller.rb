class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /ingredients
  # GET /ingredients.json
  def index
    if params[:term]
      @ingredients = Ingredient.find(:all,:conditions => ['name LIKE ?', "%#{params[:term]}%"])
    else 
      @ingredients = Ingredient.includes(:category)
    end
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show
    @invoice_ingredients = @ingredient.invoice_ingredients.includes(:invoice, :measure).joins(:invoice).order('invoices.invoice_date DESC')
    @average = @invoice_ingredients.collect(&:price_per_unit).sum.to_f / @invoice_ingredients.length if @invoice_ingredients.length > 0
 end
  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
    if(params[:parent_id])
      @ingredient.parent_id = params[:parent_id]
    end
  end

  # GET /ingredients/1/edit
  def edit
    if @ingredient.custom == 0 
      redirect_to ingredients_path, notice: "Access denied for ingredient '#{@ingredient.name}'."
    end
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.custom = 0
    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to ingredients_path, notice: 'Ingredient was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ingredient }
      else
        format.html { render action: 'new' }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to ingredients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :category_id, :last_price, :parent_id, :custom)
    end
end
