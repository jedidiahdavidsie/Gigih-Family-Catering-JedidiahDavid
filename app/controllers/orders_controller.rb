class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  protect_from_forgery with: :null_session, only: [:tambahMenuItem, :updateMenuItem]
  
  def tambahOrder
    @order = Order.new
    @order.email = params[:email]
    @order.total_price = '0'
    @order.status = 'NEW'
    @order.save!
    redirect_to '/menu_items'
  end

  def konfirmasiPesanan
    @order = Order.find_by(id: params[:order_id])
    @order.update(status: 'PAID')
    redirect_to order_url(params[:order_id])
  end

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
    @menu_items = MenuItem.all
    @order_details = OrderDetail.where(order_id: params[:id]).order(updated_at: :desc)
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to '/menu_items', notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to '/menu_items', notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to '/menu_items', notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:email, :total_price, :status)
    end
end
