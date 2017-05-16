class PdfsController < ApplicationController
  add_breadcrumb "Home", :root_path
  def purchase_report
    add_breadcrumb "Purchases", :purchases_path
    add_breadcrumb "Report"
    @title = "Purchases"
    @purchase = Purchase.PurchaseSearch(params[:start_date], params[:end_date])
  end

  def sale_report
    @title = "Sales"
    add_breadcrumb "Sales", :sales_path
    add_breadcrumb "Report"
    @sale =  Sale.SaleSearch(params[:start_date], params[:end_date])
  end
end