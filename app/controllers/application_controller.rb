class ApplicationController < ActionController::Base
 def after_sign_up_path_for(resources)
   admins_genres_path
end
  def after_sign_in_path_for(resource)
    admins_genres_path
  end
  def after_sign_out_path_for
    root_path
  end

  end
