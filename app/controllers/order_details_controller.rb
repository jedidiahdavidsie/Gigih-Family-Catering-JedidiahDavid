class OrderDetailsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :set_order_detail, only: %i[ show edit update destroy ]
  protect_from_forgery with: :null_session, only: [:tambahItemPesanan]
  def tambahItemPesanan
    @order_detail = OrderDetail.new
    @order_detail.menu_item_id= params[:menu_item_id]
    @order_detail.order_id = params[:order_id]
    @order_detail.portion_size = params[:portion_size]
    @order_detail.total_portion_price = params[:portion_size].to_f * params[:menu_item_price].to_f
    @order_detail.save!
    redirect_to order_url(params[:order_id])

    @listOfOrderItems = OrderDetail.where(order_id: params[:order_id])
    @totalPrice = 0
    @listOfOrderItems.each do |orderItem|
      @totalPrice += orderItem.total_portion_price.to_f
    end
    @order = Order.find_by(id: params[:order_id])
    @order.update(total_price: @totalPrice)
  end
  
  # GET /order_details or /order_details.json
  def index
    @order_details = OrderDetail.all
  end

  # GET /order_details/1 or /order_details/1.json
  def show
  end

  # GET /order_details/new
  def new
    @order_detail = OrderDetail.new
  end

  # GET /order_details/1/edit
  def edit
  end

  # POST /order_details or /order_details.json
  def create
    @order_detail = OrderDetail.new(order_detail_params)

    respond_to do |format|
      if @order_detail.save
        format.html { redirect_to order_url(params[:order_id]), notice: "Order detail was successfully created." }
        format.json { render :show, status: :created, location: @order_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_details/1 or /order_details/1.json
  def update
    respond_to do |format|
      if @order_detail.update(order_detail_params)
        format.html { redirect_to order_url(params[:order_id]), notice: "Order detail was successfully updated." }
        format.json { render :show, status: :ok, location: @order_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_details/1 or /order_details/1.json
  def destroy
    @order_detail.destroy

    @listOfOrderItems = OrderDetail.where(order_id: params[:order_id])
    @totalPrice = 0
    @listOfOrderItems.each do |orderItem|
      @totalPrice += orderItem.total_portion_price.to_f
    end
    @order = Order.find_by(id: params[:order_id])
    @order.update(total_price: @totalPrice)

    respond_to do |format|
      format.html { redirect_to order_url(params[:order_id]), notice: "Order detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_detail
      @order_detail = OrderDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_detail_params
      params.require(:order_detail).permit(:menu_item_id, :order_id, :portion_size, :total_portion_price)
    end
end
