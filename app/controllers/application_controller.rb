class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :create_logs, only: [:your, :actions]
  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "dash"
    end
  end

  def create_logs(msg)
    @log = Log.new
    @log.user_id = current_user.id
    @log.description = msg
    @log.save
  end
  #
  # def not_found
  #   raise ActionController::RoutingError.new('Not Found')
  # end

end
