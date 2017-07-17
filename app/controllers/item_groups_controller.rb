class ItemGroupsController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Item Group", :item_groups_path

  def new
    @title = "Add"
    add_breadcrumb "New"
    @item_group = ItemGroup.new
    @item_names = ItemGroup.order(:name)
  end

  def create
    @item_group = ItemGroup.new(group_params)
    if @item_group.parent_id.nil?
      @item_group.parent_id = nil
    end
    if @item_group.save
      @msg = "Item Group added"
      create_logs(@msg)
      flash[:success] = "Item Group added"
      redirect_to :item_groups
    else
      flash[:error] = "Couldn't add item group"
      render :new
    end
  end

  def edit
    @title = "Edit"
    add_breadcrumb "Edit"
    @item_group = ItemGroup.find(params[:id])
    @item_names = ItemGroup.order(:name)
  end

  def update
    @item_group = ItemGroup.find(params[:id])
    if @item_group.update(group_params)
      @msg = "Item Group updated"
      create_logs(@msg)
      flash[:success] = "Item Group updated"
      redirect_to :item_groups
    else
      flash[:error] = "Couldn't update item group"
      redirect_to :root
    end
  end

  def index
    @title ="List"
    @perpage = 20
    @item_groups = ItemGroup.paginate(:page => params[:page], :per_page => @perpage).order("name ASC")
    @page = params[:page] || 1
  end

  def show

  end

  def destroy
    @item_group = ItemGroup.destroy(params[:id])
    if @item_group.destroyed?
      @msg = "Item Group deleted"
      create_logs(@msg)
      flash[:success] = @msg
      redirect_to :item_groups
    else
      flash[:error] = "Couldn't delete Item Group"
      redirect_to :root
    end
  end

  private

  def group_params
    params.require(:item_group).permit(:name, :parent_id, :description)
  end
end
