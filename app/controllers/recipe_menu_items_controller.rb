class RecipeMenuItemsController < ApplicationController
  before_action :set_recipe_menu_item, only: [:show, :edit, :update, :destroy]

  # GET /recipe_menu_items
  # GET /recipe_menu_items.json
  def index
    @recipe_menu_items = RecipeMenuItem.all
  end

  # GET /recipe_menu_items/1
  # GET /recipe_menu_items/1.json
  def show
  end

  # GET /recipe_menu_items/new
  def new
    @recipe_menu_item = RecipeMenuItem.new
  end

  # GET /recipe_menu_items/1/edit
  def edit
  end

  # POST /recipe_menu_items
  # POST /recipe_menu_items.json
  def create
    @recipe_menu_item = RecipeMenuItem.new(recipe_menu_item_params)

    respond_to do |format|
      if @recipe_menu_item.save
        format.html { redirect_to @recipe_menu_item, notice: 'Recipe menu item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe_menu_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe_menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_menu_items/1
  # PATCH/PUT /recipe_menu_items/1.json
  def update
    respond_to do |format|
      if @recipe_menu_item.update(recipe_menu_item_params)
        format.html { redirect_to @recipe_menu_item, notice: 'Recipe menu item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recipe_menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_menu_items/1
  # DELETE /recipe_menu_items/1.json
  def destroy
    @recipe_menu_item.destroy
    respond_to do |format|
      format.html { redirect_to recipe_menu_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_menu_item
      @recipe_menu_item = RecipeMenuItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_menu_item_params
      params.require(:recipe_menu_item).permit(:recipe_id, :menu_item_id)
    end
end
