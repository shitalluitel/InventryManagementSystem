class SalesController < ApplicationController
  def new
    @sale = Sale.new
    @item = Item.order(:name)
  end

  def create
    @sale = Sale.new(purchase_params)
    @stocks = Stock.where(item_id: @sale.item_id)
    @stocks.each do |f|
      @stock = f
    end
    if @sale.save
      @stock.quantity = @stock.quantity - @sale.quantity
      @stock.save

      @msg = "Item sold."
      create_logs(@msg)
      flash[:success] = @msg
      redirect_to :new_sale
    else
      flash[:alert] = "Couldn't sale item."
      render "new"
    end
  end

  def index
    @perpage = 20
    @sales = Sale.paginate(:page => params[:page], :per_page => @perpage)
    @page = params[:page] || 1
  end

  def item_select
    @item = Item.select('name,id');
    render json: @item
  end

  def getprice
    @item = Item.find(params[:id])
    @value = @item.stock.unit_price
    render json: @value
  end

  private

  def purchase_params
    params.require(:purchase).permit(:customer_id, :item_id, :unit_cost_price, :quantity, :cash_credit)
  end
end
