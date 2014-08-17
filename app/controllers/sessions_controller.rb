class SessionsController < ApplicationController
  def new

  end

  def destroy

  end

  def create
    user = "TEST"
    user = User.find_by_email(params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])

      sign_in user

      #redirect_to user
      #redirect_back_or user
      redirect_to  about_url

    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
