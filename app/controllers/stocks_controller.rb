class StocksController < ApplicationController
  def index
    @sum = Stock.all().group(:item_id).sum(:quantity)
  end
end
