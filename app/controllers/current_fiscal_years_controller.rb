class CurrentFiscalYearsController < ApplicationController

  def new
    @current_fiscal_year = CurrentFiscalYear.new
  end

  def create
    @current_fiscal_year = CurrentFiscalYear.new(fiscal_params)
    if @current_fiscal_year.save
      redirect_to :fiscal_years
    else
      redirect_to :root
    end
  end

  def edit
    @current_fiscal_year = CurrentFiscalYear.find(params[:id])
  end

  def update
    @current_fiscal_year = CurrentFiscalYear.find(params[:id])
    if @current_fiscal_year.update(fiscal_params)
      redirect_to :fiscal_years
    else
      redirect_to :root
    end
  end

  private

  def fiscal_params
    params.require(:current_fiscal_year).permit(:fiscal_year_id)
  end
end
