class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @users = User.find(params[:id])
    @books = @users.books
    @book = Book.new
    @user = current_user
  end
  
  def index 
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    @user.save
    flash[:notice] = "Signed in successfully."
    redirect_to user_path(current_user.id)
  end
  
  def edit
    @user = User.find(params[:id])
  end
 
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path
    else
      render :edit
    end
  end
  
 private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction,)  
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
     redirect_to user_path(current_user)
    end
  end

end