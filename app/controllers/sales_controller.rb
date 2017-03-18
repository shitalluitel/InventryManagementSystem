class SalesController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Sales", :sales_path
  def new
    @title = "Add"
    add_breadcrumb "New"
    @sale = Sale.new
    @sale_item = @sale.sale_items.build
    @item = Item.order(:name)
  end

  def create
    @sale = Sale.new(sale_params)
    @totalcost = 0
    @sale.sale_items.each do |total|
      if total.present?
        @totalcost += total.unit_price * total.quantity
      end
    end
    @sale.total = @totalcost
    @fiscal_year = FiscalYear.all
    @fiscal_year.each do |f|
      @fiscal = f.name
    end
    @sale.fiscal_year = @fiscal
    if @sale.save
      @sale.sale_items.each do |g|
        if g.present?
          @stocks = Stock.where(item_id: g.item_id)
          @stocks.each do |f|
            @stock = f
          end
          @stock.quantity = @stock.quantity + g.quantity
          @stock.save
        end
      end
      @msg = "Purchase made by " + current_user.email + " from " +@sale.customer.customer_name+ "."
      create_logs(@msg)
      flash[:success] = "Items added."

      redirect_to :sales
    else
      @item = Item.order(:name)
      render 'new'
    end
  end

  def index
    @title = "List"
    @perpage = 20
    @sales = Sale.paginate(:page => params[:page], :per_page => @perpage)
    @page = params[:page] || 1
  end

  def get_unit_price
    @item = Stock.where(item_id: params[:id])
    @item.each do |f|
      @data = f.unit_price
      break
    end
    render json: @data
  end
  private
  def sale_params
    params.require(:sale).permit(:customer_id, :date, :discount, :bill_number, sale_items_attributes: [:sale_id , :item_id, :quantity, :unit_price, :_destroy ])
  end
end
