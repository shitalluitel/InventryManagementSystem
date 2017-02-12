class UsersController < ApplicationController
  prepend_before_filter :require_no_authentication, :only => []
  prepend_before_filter :authenticate_user!

  def new
    @user = User.new
  end

  def index
    @perpage = 10
    @users = User.where.not(id: current_user.id) #to discard current user and filter the pagination
    @users = @users.paginate(:page => params[:page], :per_page => @perpage)
    @page = params[:page] || 1
  end

  def destroy
    @user = User.destroy(params[:id])
    if @user.destroyed?
      @send = @user.email + " is destroyed."
      create_logs( @send )
    end
    redirect_to @user
  end

end
