class PurchasesController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Purchases", :purchases_path
  def new
    @title = "Add"
    add_breadcrumb "New"
    @purchase = Purchase.new
    @purchase_item = @purchase.purchase_items.build
    @stock =  Stock.where("quantity >= ?", 0)

    @item = Item.order(:name)
    @date = Purchase.limit(1).reverse
  end
  def create
    @purchase = Purchase.new(purchase_params)
    @totalcost = 0
    @purchase.purchase_items.each do |total|
      if total.present?
        @totalcost += total.unit_price * total.quantity
      end
    end
    @purchase.total = @totalcost
    @fiscal_year = FiscalYear.all
    @fiscal_year.each do |f|
      @fiscal = f.name
    end
    @purchase.fiscal_year = @fiscal
    if @purchase.save
      @purchase.purchase_items.each do |g|
       if g.present?
         @stocks = Stock.where(item_id: g.item_id)
         @stocks.each do |f|
           @stock = f
         end
         @stock.unit_price = ((@stock.unit_price * @stock.quantity) + (g.unit_price * g.quantity)) / (@stock.quantity + g.quantity)
         @stock.quantity = @stock.quantity + g.quantity
         @stock.save
       end
      end
      @msg = "Purchase made by " + current_user.email + " from " +@purchase.vendor.name+ "."
      create_logs(@msg)
      flash[:success] = "Items added."

      redirect_to :purchases
    else
      @item = Item.order(:name)
      render 'new'
    end
  end

  def index
    @title = "List"
    @perpage = 20
    @purchase = Purchase.paginate(:page => params[:page], :per_page => @perpage)
    @page = params[:page] || 1
  end

  private

  def purchase_params
    params.require(:purchase).permit(:vendor_id, :date, :bill_number, :discount, purchase_items_attributes: [:purchase_id , :item_id, :quantity, :unit_price, :_destroy ])
  end
end
