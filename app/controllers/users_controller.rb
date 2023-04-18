class UsersController < ApplicationController
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
    @user.update(user_params)
    redirect_to user_path
  end
   
 private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction,)  
  end

end