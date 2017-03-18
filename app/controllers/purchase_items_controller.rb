class PurchaseItemsController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Purchases", :purchases_path
  def show
    @title = "List"
    @purchase = Purchase.find(params[:id])
    add_breadcrumb "#{@purchase.vendor.name} / List"
    @perpage =20
    @purchase_item = PurchaseItem.where(purchase_id: params[:id])
    @purchase_items = @purchase_item.paginate(:page => params[:page], :per_page => @perpage)
    @page = params[:page] || 1
  end
end