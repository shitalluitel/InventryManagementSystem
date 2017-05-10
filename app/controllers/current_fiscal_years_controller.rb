class CurrentFiscalYearsController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Fiscal Year", :fiscal_years_path
  def new
    @title = "Add"
    add_breadcrumb "Current Fiscal Year / New"
    @current_fiscal_year = CurrentFiscalYear.new
  end

  def create
    @current_fiscal_year = CurrentFiscalYear.new(fiscal_params)
    if @current_fiscal_year.save
      @msg = "Added current fiscal year " + @current_fiscal_year.fiscal_year.name
      create_logs(@msg)
      flash[:success] = @msg
      redirect_to :fiscal_years
    else
      render :new
    end
  end

  def edit
    @title = "Edit"
    add_breadcrumb "Current Fiscal Year / Edit"
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
      render :edit
    end
  end

  private

  def fiscal_params
    params.require(:current_fiscal_year).permit(:fiscal_year_id)
  end
end
