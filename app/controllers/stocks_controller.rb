class StocksController < ApplicationController
  def show
    @item = Item.where("item_id = ?", params[:item_id])
  end
end
