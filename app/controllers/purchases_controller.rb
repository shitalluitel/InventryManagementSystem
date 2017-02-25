class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
    @item = Item.order(:name)
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @stocks = Stock.where(item_id: @purchase.item_id)
    @stocks.each do |f|
      @stock = f
    end
    if @purchase.save
      @stock.unit_price = ((@stock.unit_price * @stock.quantity) + (@purchase.unit_cost_price * @purchase.quantity)) / (@stock.quantity + @purchase.quantity)
      @stock.quantity = @stock.quantity + @purchase.quantity
      @stock.est_sell_price = ((@stock.est_sell_price * @stock.quantity) + (@purchase.est_sell_price * @purchase.quantity)) / (@stock.quantity + @purchase.quantity)
      @stock.save

      @msg = "Item purchased."
      create_logs(@msg)
      flash[:success] = @msg
      redirect_to :new_purchase
    else
      flash[:alert] = "Couldn't purchase item."
      render "new"
    end
  end

  def index

  end

  def item_select
    @item = Item.select('name,id');
    render json: @item
  end

  private

  def purchase_params
    params.require(:purchase).permit(:vendor_id, :item_id, :unit_cost_price, :est_sell_price, :quantity, :cash_credit)
  end
end
