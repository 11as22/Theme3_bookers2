class BooksController < ApplicationController
  def new
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book)
  end
  
  def show
    @user = current_user
    @book = Book.new
    @bookz = Book.find(params[:id])
    @books = Book.all
    @books = Book.find(params[:id])
  end
  

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path
  end

  def destroy
    book = Book.find(params[:id])  
    book.destroy 
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end

end
