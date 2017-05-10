class ItemsController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Item", :items_path
  def new
    @title = "Add"
    add_breadcrumb "New"
    @item = Item.new
    @stock = @item.build_stock
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      @msg = "Item added."
      create_logs(@msg)
      flash[:success] = @msg
      redirect_to :new_item
    else
      flash[:alert] = "Couldn't add item."
      render "new"
    end
  end

  def edit
    @title = "Edit"
    add_breadcrumb "Edit"
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      @msg = "Item Updated."
      create_logs(@msg)
      flash[:success] = @msg
      redirect_to :items
    else
      flash[:alert] = "Couldn't update item."
      render "edit"
    end

  end

  def index
    @title ="List"
    @perpage = 20
    @items = Item.paginate(:page => params[:page], :per_page => @perpage)
    @page = params[:page] || 1
    respond_to do |format|
      format.html
    end
  end

  def show
    @title = "View"
    add_breadcrumb "Show"
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.destroy(params[:id])
    @msg = "Item #{@item.name} destroyed."
    if @item.destroyed?
      create_logs(@msg)
      flash[:success] = "Item deleted successfully."
    else
      flash[:alert] = "Couldn' delete item."
    end
  end

  def show_lowest
    @title = "List"
    @perpage = 20
    add_breadcrumb "List"
    @stock = Stock.where("quantity <= ?", 5)
    @show = @stock.paginate(:page => params[:page], :per_page => @perpage)
    @page = params[:page] || 1
  end

  private

  def item_params
    params.require(:item).permit(:name, :unit_id, :item_code, :item_group_id, :description, stock_attributes: [:item_id, :quantity, :unit_price, :est_sell_price])
  end
end
