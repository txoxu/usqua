class ApplicationController < ActionController::Base
<<<<<<< HEAD
  before_action :require_login
  add_flash_types :success, :danger

  private

  def not_authenticated
    redirect_to login_path
  end
=======
>>>>>>> 81dd2749b47c942904553ec36883c554e458af9b
end
