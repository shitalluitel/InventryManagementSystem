class SaleItemsController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Sales", :sales_path
  def show
    @title = "List"
    @sale = Sale.find(params[:id])
    add_breadcrumb "#{@sale.customer.customer_name} / List"
    @perpage =20
    @sale_item = SaleItem.where(sale_id: params[:id])
    @sale_items = @sale_item.paginate(:page => params[:page], :per_page => @perpage)
    @page = params[:page] || 1
  end
end
