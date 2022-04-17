class UsersController < ApplicationController
  def show

    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
  end



  def edit
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def user_params
    params.require(:book).permit(:title, :body, :image)
  end
end
