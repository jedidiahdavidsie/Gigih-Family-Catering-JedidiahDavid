class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: %i[ show edit update destroy]
  protect_from_forgery with: :null_session, only: [:tambahMenuItem, :updateMenuItem]
  
  def tambahMenuItem
    @menu_item = MenuItem.new
    @menu_item.name = params[:name]
    @menu_item.description = params[:description]
    @menu_item.price = params[:price]
    @menu_item.menu_category_id = params[:menu_category_id]
    @menu_item.save!
    redirect_to '/menu_items'
  end

  def updateMenuItem
    @menu_item2 = MenuItem.find_by(id: params[:id])
    @menu_item2.update(name: params[:name], description: params[:description], price: params[:price], menu_category_id: params[:menu_category_id])

    redirect_to '/menu_items'
  end
  
  # GET /menu_items or /menu_items.json
  def index
    @menu_items = MenuItem.all
    @menu_category_items = MenuCategory.all
    @order_items = Order.all
  end

  # GET /menu_items/1 or /menu_items/1.json
  def show
  end

  # GET /menu_items/new
  def new
    @menu_item = MenuItem.new
    @menu_category_items = MenuCategory.all
  end

  # GET /menu_items/1/edit
  def edit
    @menu_category_items = MenuCategory.all
  end

  # POST /menu_items or /menu_items.json
  def create
    @menu_item = MenuItem.new(menu_item_params)
    @menu_category_items = MenuCategory.all

    respond_to do |format|
      if @menu_item.save
        format.html { redirect_to '/menu_items', notice: "Menu item was successfully created." }
        format.json { render :show, status: :created, location: @menu_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_items/1 or /menu_items/1.json
  def update
    respond_to do |format|
      if @menu_item.update(menu_item_params)
        format.html { redirect_to '/menu_items', notice: "Menu item was successfully updated." }
        format.json { render :show, status: :ok, location: @menu_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_items/1 or /menu_items/1.json
  def destroy
    @menu_item.destroy

    respond_to do |format|
      format.html { redirect_to '/menu_items', notice: "Menu item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_item
      @menu_item = MenuItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_item_params
      params.require(:menu_item).permit(:name, :description, :price, :menu_category_id)
    end
end
