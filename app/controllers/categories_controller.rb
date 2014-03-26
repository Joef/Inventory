class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @categories = Category.find_all_others(@category.id)
    @children = @categories.where(parent_id: @category.id)
    @ingredients = @category.ingredients
    #use if not displaying all other categories
    #@children = @category.children.all
  end

  # GET /categories/new
  def new
    @category = Category.new
    if(params[:parent_id])
      @category.parent_id = params[:parent_id]
    end
  end

  # GET /categories/1/edit
  def edit
    if @category.custom == 0 
      redirect_to categories_path, notice: "Access denied for category '#{@category.name}'."
    end
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    @category.custom = 0 #all products created by the app are custom
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: "Category '#{@category.name}' was successfully created." }
        format.json { render action: 'show', status: :created, location: @category }
      else
        format.html { render action: 'new' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_path, notice: "Category '#{@category.name}' was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.includes(:ingredients).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description, :parent_id, :custom)
    end
end
