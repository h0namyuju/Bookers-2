class BooksController < ApplicationController
  def new

  end

  def show
    @books = Book.all
  end

  def index
     @book = Book.new
     @books = Book.all
  end

  def create
    @book = book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:success] = "Book was successfully updated."
    redirect_to book_path(@book.id)
    else
    render :"users/edit"
    end
  end
    
  def destrpy
      book =　Book.find(params[:id])
      book.destroy
      flash[:success] = "Book was successfully destroyed."
      redirect_to '/book'
  end


  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
  
end
