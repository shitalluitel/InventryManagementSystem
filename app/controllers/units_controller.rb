class UnitsController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Units", :units_path

  def new
    add_breadcrumb "New"
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(unit_params)
    if @unit.save
      @msg = "Added unit " + @unit.name
      create_logs(@msg)
      flash[:success] = @unit.name + " Unit added."
      redirect_to :units
    else
      flash[:alert] = "Units not created."
      redirect_to :new_unit
    end
  end

  def edit
    @unit = Unit.find(params[:id])
  end

  def update
    @unit = Unit.find(params[:id])
    @msg = "Updated unit. "
    if @unit.update(unit_params)
      create_logs(@msg)
      flash[:success] = "Unit updated."
      redirect_to :units
    else
      flash[:error] = "Couldn't update unit."
      redirect_to :edit_unit
    end
  end

  def destroy
    @unit = Unit.destroy(params[:id])
    if @unit.destroyed?
      @msg = "Destroyed unit " + @unit.name
      create_logs(@msg)
      flash[:success] = "Unit destoyed successfully."
      redirect_to :units
    else
      flash[:error] = "Couldn't delete unit."
      redirect_to :root
    end
  end

  def index
    @perpage = 10
    @units = Unit.paginate( :page => params[:page], :per_page => @perpage).order("name ASC")
    @page = params[:page] || 1
  end

  private

  def unit_params
    params.require(:unit).permit(:name, :print_name)
  end
end
