class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_global_parameter


  def set_global_parameter
  	@subjects = Subject.all
  end

  
  
end
