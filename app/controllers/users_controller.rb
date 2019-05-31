class UsersController < ApplicationController
  before_action :redirect_if_signed_in, only: [:new, :create]
  before_action :redirect_if_not_signed_in, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "#{@user.email} has been created."
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    render layout: 'dashboard'
  end

  def update

  end

  def destroy

  end

  private
    def set_user
      @user = User.find_by_id(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :birthdate, :password)
    end
end
