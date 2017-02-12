class LogsController < ApplicationController
  def index
    @perpage = 50
    @logs =  Log.paginate(:page => params[:page], :per_page => @perpage)
    @page = params[:page] || 1
  end

  private

  # def set_options(mes)
  #   @log = Log.new
  #   @log.user_id = current_user.id
  #   @log.description = mes
  #   @logs.browser = request.env['HTTP_USER_AGENT']
  #   @logs.ip_address = request.env['REMOTE_ADDR']
  #   @logs.save
  # end

end
