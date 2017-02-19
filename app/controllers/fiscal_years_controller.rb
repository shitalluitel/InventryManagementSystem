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
      flash[:success] = "Fiscal Year added."
      redirect_to :root
    else
      flash[:error] = "Couldn't add fiscal year."
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
      flash[:success] = "Fiscal Year updated."
      redirect_to :fiscal_years
    else
      flash[:error] = "Couldn't update fiscal year."
      redirect_to :admin
    end
  end

  def index
    @perpage = 10
    @current_fiscal_year = CurrentFiscalYear.where.not(fiscal_year_id: nil)
    @current_fiscal_year.each do |f|
      @fiscal_id = f.id
      @fiscal_name = f.fiscal_year.name
    end
    @fiscal_year = FiscalYear.paginate(:page => params[:page], :per_page => @perpage )
    @page = params[:page] || 1
  end

  def destroy
    @fiscal_year = FiscalYear.destroy(params[:id])
    if @fiscal_year.destroyed?
      @msg = "Fiscal Year deleted."
      create_logs(@msg)
      flash[:success] = @msg
      redirect_to :fiscal_years
    else
      flash[:error] = "Couldn't delete fiscal year"
      redirect_to :root
    end
  end
  private

  def fiscal_params
    params.require(:fiscal_year).permit(:name, :start_date, :end_date)
  end
end
