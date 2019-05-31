class SessionController < ApplicationController
  before_action :redirect_if_signed_in, except: [:destroy]
  before_action :redirect_if_not_signed_in, only: [:destroy]

  def new
  
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "email or password doesn't match"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
