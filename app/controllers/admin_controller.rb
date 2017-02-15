class AdminController < ApplicationController
  def index
    @count = 0
    @user = User.all
    @user.each do |f|
      if f.deleted_at.nil?
        @count += 1
      else
        next
      end
    end
    @log= Log.all.count
  end
end
