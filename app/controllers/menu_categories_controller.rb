class MenuCategoriesController < ApplicationController
  before_action :set_menu_category, only: %i[ show edit update destroy ]
  protect_from_forgery with: :null_session, only: [:tambahMenuItem]
  
  def tambahMenuCategory
    @menu_category = MenuCategory.new
    @menu_category.name = params[:name]
    @menu_category.description = params[:description]
    @menu_category.save!
    redirect_to '/menu_items'
  end
  
  # GET /menu_categories or /menu_categories.json
  def index
    @menu_categories = MenuCategory.all
  end

  # GET /menu_categories/1 or /menu_categories/1.json
  def show
  end

  # GET /menu_categories/new
  def new
    @menu_category = MenuCategory.new
  end

  # GET /menu_categories/1/edit
  def edit
  end

  # POST /menu_categories or /menu_categories.json
  def create
    @menu_category = MenuCategory.new(menu_category_params)

    respond_to do |format|
      if @menu_category.save
        format.html { redirect_to redirect_to '/menu_items', notice: "Menu category was successfully created." }
        format.json { render :show, status: :created, location: @menu_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_categories/1 or /menu_categories/1.json
  def update
    respond_to do |format|
      if @menu_category.update(menu_category_params)
        format.html { redirect_to '/menu_items', notice: "Menu category was successfully updated." }
        format.json { render :show, status: :ok, location: @menu_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_categories/1 or /menu_categories/1.json
  def destroy
    @menu_category = MenuCategory.find_by(id: params[:id])
    puts "8"
    @menu_category.destroy

    respond_to do |format|
      format.html { redirect_to '/menu_items', notice: "Menu category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_category
      @menu_category = MenuCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_category_params
      params.require(:menu_category).permit(:name, :description)
    end
end
