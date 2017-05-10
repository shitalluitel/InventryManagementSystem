class CustomersController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Customers", :customers_path
  def new
    @title = "Add"
    add_breadcrumb "New"
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      @msg = "Customer created."
      create_logs(@msg)
      flash[:success] = @msg
      redirect_to :customers
    else
      render "new"
    end
  end

  def edit
    add_breadcrumb "Edit"
    @title = "Edit"
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      @msg = "Customer has been updated "
      create_logs(@msg)
      flash[:success] = @msg
      redirect_to :customers
    else
      render :edit
    end
  end

  def destroy
    @customer = Customer.destroy(params[:id])
    @msg = "Customer #{@customer.customer_name} destroyed."
    if @customer.destroyed?
      create_logs(@msg)
      flash[:success] = @msg
    else
      flash[:alert] = "Couldn' delete customer."
    end
    redirect_to :customers
  end

  def index
    @title = "List"
    @perpage = 10
    @customers = Customer.paginate(:page => params[:page], :per_page => @perpage)
    @page = params[:page] || 1
  end

  def show
    @customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:customer_name, :address, :phone_number)
  end
end
