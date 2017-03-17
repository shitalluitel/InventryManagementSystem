class VendorsController < ApplicationController
  def new
    @title = "Add"
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      @msg = "Vendor created."
      create_logs(@msg)
      flash[:success] = @msg
      redirect_to :new_vendor
    else
      render "new"
    end
  end

  def edit
    @title = "Edit"

  end

  def update

  end

  def destroy

  end

  def index
    @title = "List"
    @perpage = 10
    @vendors = Vendor.paginate(:page => params[:page], :per_page => @perpage)
    @page = params[:page] || 1
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :address, :phone_no, :email)
  end
end
