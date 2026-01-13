class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  end

  private
  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
    if request.referrer.include?("sign_up")
      users_profile_path
    else
      root_path
      
    end 
  end

  

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  #アカウント登録後のリダイレクト先
  def after_sign_up_path_for(resource)
    users_profile_path
  end

  #アカウント編集後のリダイレクト先
  def after_update_path_for(resource)
    users_profile_path
  end
end
