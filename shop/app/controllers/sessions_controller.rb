class SessionsController < ApplicationController
  def new
  end
  
def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        if new_here?(current_user)
          if seller?(current_user)
            redirect_back_or seller_create_url
          else
            redirect_back_or customer_create_url
          end
        else
          redirect_back_or current_user
        end
      else 
        message  = "Konto nieaktywne. "
        message += "Sprawdź swój email czy nie ma maila aktywacyjnego. "
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Niepoprawna kombinacja email/hasło. '
      render 'new'
    end
end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
