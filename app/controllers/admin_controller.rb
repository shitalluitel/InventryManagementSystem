class AdminController < ApplicationController
  def index
    @count = 0
    @user = User.where(deleted_at: nil).count
    @log= Log.all.count
    @purchase = Purchase.all.count
    # @sale = Sale.all.count

    @purchase_week_count =  Purchase.where("created_at >= ?", 1.week.ago.utc).count
    @purchase_week_amount = Purchase.where("created_at >= ?", 1.week.ago.utc).sum(:total)

    @purchase_month_count = Purchase.where("created_at >= ?", 30.days.ago.utc).count
    @purchase_month_amount = Purchase.where("created_at >= ?", 30.days.ago.utc).sum(:total)

    @purchase_today_count = Purchase.where("created_at >= ?", Date.today).count
    @purchase_today_amount =  Purchase.where("created_at >= ?", Date.today).sum(:total)

    @sale_week_count = Purchase.where("created_at >= ?", 1.week.ago.utc).count
    @sale_week_amount = Purchase.where("created_at >= ?", 1.week.ago.utc).sum(:total)

    @sale_month_count = Purchase.where("created_at >= ?", 30.days.ago.utc).count
    @sale_month_amount = Purchase.where("created_at >= ?", 30.days.ago.utc).sum(:total)

    @sale_today_count = Purchase.where("created_at >= ?", Date.today).count
    @sale_today_amount = Purchase.where("created_at >= ?", Date.today).sum(:total)

    @total_purchase = Purchase.all.sum(:total)
    @total_sale = Purchase.all.sum(:total)
  end

  def show
    @current_fiscal = CurrentFiscalYear.all
    @current_fiscal.each do |f|
      @name = f.fiscal_year.name
      break
    end
  end
end
