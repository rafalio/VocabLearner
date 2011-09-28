class SessionsController < ApplicationController
  skip_before_filter :authorize

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, notice: "You've signed in!" 
  end

  def destroy
    session[:user_id] = nil 
    redirect_to root_url, notice: "You've logged out!"
  end

end
