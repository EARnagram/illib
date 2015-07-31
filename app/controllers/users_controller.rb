class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @comics = @user.comics
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      session[:user_id] = nil
      redirect_to root_path
    else
      flash[:error] = "Error! Don't Leave Us!"
      redirect_to user_path(current_user)
    end
  end

  def user_params
    params.require(:user).permit( :username, :fav_pub, :email, :password, :password_confirmation)
  end



end
