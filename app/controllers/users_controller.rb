class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def index 
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to user_path(current_user.id)
  end
  
  def edit
    @user = User.find(params[:id])
    
  end
 
 private
  def user_params
    params.require(:user).permit(:name, :profile_image, )  
  end

end