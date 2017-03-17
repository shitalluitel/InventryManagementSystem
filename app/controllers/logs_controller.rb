class LogsController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Logs", :logs_path
  def index
    @title = "List"
    @perpage = 20
    @logs =  Log.paginate(:page => params[:page], :per_page => @perpage).order("Created_at DESC")
    @page = params[:page] || 1
  end
end
