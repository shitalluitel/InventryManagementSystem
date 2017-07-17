class SalesController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Sales", :sales_path
  def new
    @title = "Add"
    add_breadcrumb "New"
    @sale = Sale.new
    @sale_item = @sale.sale_items.build
    @item = Item.joins(:stock).where("quantity > ?", 0)
    @tax = CompanyProfile.first.tax
  end

  def create
    @sale = Sale.new(sale_params)
    @partial_total = 0
    @sale.sale_items.each do |total|
      if total.unit_price.present? && total.quantity.present?
        @partial_total += total.unit_price * total.quantity
      end
    end

    @company = CompanyProfile.all
    @company.each do |f|
      @tax = f.tax
      break
    end

    @taxable = @partial_total - @sale.discount
    @tax_amount = ( @tax.to_f / 100 ) * @taxable
    @total_amount = @taxable + @tax_amount

    @fiscal_year = FiscalYear.all
    @fiscal_year.each do |f|
      @fiscal = f.name
    end


    @sale.partial_total = @partial_total
    @sale.tax_amount = @tax_amount
    @sale.total = @total_amount
    @sale.fiscal_year = @fiscal

    @sale.fiscal_year = @fiscal

    @customer = Customer.where("customer_name = ?", "Cash").select(:id)
    if @sale.customer_id === @customer
      @sale.credit_limit = 0
    end

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
    @sale_report = Sale.search(params[:start_date], params[:end_date])
    @sales = Sale.paginate(:page => params[:page], :per_page => @perpage)
    @page = params[:page] || 1
  end

  def get_unit_price
    @item = Stock.where(item_id: params[:id]).select(:est_sell_price,:unit_price,:quantity)
    @item.each do |f|
      @data = f
      break
    end
    render json: @data
  end
  private
  def sale_params
    params.require(:sale).permit(:customer_id, :date, :bill_number, :discount, :credit_limit, sale_items_attributes: [:sale_id , :item_id, :quantity, :unit_price, :_destroy ])
  end
end
