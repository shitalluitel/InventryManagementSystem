class CurrentFiscalYearsController < ApplicationController
  add_breadcreumb "Home", :root_path
  add_breadcrumb "Current Fiscal Year"
  def new
    add_breadcrumb "New"
    @current_fiscal_year = CurrentFiscalYear.new
  end

  def create
    @current_fiscal_year = CurrentFiscalYear.new(fiscal_params)
    if @current_fiscal_year.save
      @msg = "Added current fiscal year " + @current_fiscal_year.fiscal_year.name
      create_logs(@msg)
      flash[:success] = "Current Fiscal Year " + @current_fiscal_year + " added."
      redirect_to :fiscal_years
    else
      flash[:error] = "Went something wrong. Couldn't add current fiscal year."
      redirect_to :root
    end
  end

  def edit
    add_breadcrumb "Edit"
    @current_fiscal_year = CurrentFiscalYear.find(params[:id])
  end

  def update
    @current_fiscal_year = CurrentFiscalYear.find(params[:id])
    @msg = "Updated current fiscal year." + @current_fiscal_year.fiscal_year.name
    if @current_fiscal_year.update(fiscal_params)
      @msg = @msg + " to " + @current_fiscal_year.fiscal_year.name
      create_logs(@msg)
      flash[:success] = "Current Fiscal Year updated."
      redirect_to :fiscal_years
    else
      flash[:error] = "Couldn't Update. Went something wrong."
      redirect_to :root
    end
  end

  private

  def fiscal_params
    params.require(:current_fiscal_year).permit(:fiscal_year_id)
  end
end
