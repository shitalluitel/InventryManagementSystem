class VendorsController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Suppliers", :vendors_path
  def new
    @title = "Add"
    add_breadcrumb "New"
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
    add_breadcrumb "Edit"
    @title = "Edit"
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update(vendor_params)
      @msg = "Vendor Updated"
      create_logs(@msg)
      redirect_to :vendors
    else
      render "edit"
    end
  end

  def destroy

  end

  def show
    @title = "View"
    add_breadcrumb "Show Details"
    @vendor = Vendor.find(params[:id])
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
