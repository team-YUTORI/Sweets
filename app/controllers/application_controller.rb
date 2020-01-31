class ApplicationController < ActionController::Base


  #ログインし後の遷移先を、adminnかcustomerによって分けた
  def after_sign_in_path_for(resource)
    if admin_signed_in?
      admins_users_path
    else customer_signed_in?
      user_path(current_customer)
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end  

end
