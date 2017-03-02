class AdminController < ApplicationController
  def index
    @count = 0
    @user = User.where(deleted_at: nil).count
    @log= Log.all.count
    @purchase = Purchase.all.count
    # @sale = Sale.all.count
  end
end
