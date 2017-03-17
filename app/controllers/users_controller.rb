class UsersController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "User", :users_path

  prepend_before_filter :require_no_authentication, :only => []
  prepend_before_filter :authenticate_user!

  def new
    @title = "Add"
    add_breadcrumb "New"
    @user = User.new
  end

  def index
    @perpage = 10
    @users = User.where(deleted_at: nil) #to discard current user and filter the pagination
    @users = @users.where.not(id: current_user.id)
    @users = @users.paginate(:page => params[:page], :per_page => @perpage).order('first_name ASC')
    @page = params[:page] || 1
  end

  def destroy
    @user = User.find(params[:id])
    if @user.deleted_at.nil?
      @user.deleted_at = Time.now.strftime("%d/%m/%Y %H:%M")
      if @user.save
        @send = "Destroyed " + @user.email
            create_logs( @send )
        redirect_to :users_view
      end
    end
    redirect_to :admin
  end

end
