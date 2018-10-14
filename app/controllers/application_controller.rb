class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html:"hello,world@sample_app"
  end
end
