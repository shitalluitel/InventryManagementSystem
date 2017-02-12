class AdminController < ApplicationController
  def index
    @user = User.all.count
    @log= Log.all.count
  end
end
