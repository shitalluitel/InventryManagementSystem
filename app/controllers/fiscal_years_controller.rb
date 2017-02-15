class FiscalYearsController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "FiscalYear", :fiscal_years_path
  def new
    add_breadcrumb "New"
    @fiscal_year = FiscalYear.new
  end

  def create
    @fiscal_year = FiscalYear.new(fiscal_params)
    if @fiscal_year.save
      @msg = "Fiscal Year " + @fiscal_year.name + " added."
      create_logs(@msg)
      redirect_to :root
    else
      redirect_to @fiscal_year
    end
  end

  def edit
    add_breadcrmb "Edit"
    @fiscal_year = FiscalYear.find(params[:id])
  end

  def update
    @fiscal_year = FiscalYear.find(params[:id])
    @msg = "Fiscal Year " + @fiscal_year.name + " updated."
    if @fiscal_year.update(fiscal_params)
      create_logs(@msg)
      redirect_to :fiscal_years
    else
      redirect_to :admin
    end
  end

  def index
    @perpage = 10
    @fiscal_year = FiscalYear.paginate(:page => params[:page], :per_page => @perpage )
    @page = params[:page] || 1
  end

  private

  def fiscal_params
    params.require(:fiscal_year).permit(:name, :start_date, :end_date)
  end
end
