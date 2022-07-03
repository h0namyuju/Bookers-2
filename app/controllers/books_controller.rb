class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def show
    @books = Book.find(params[:id])
    @book = Book.new
    @user = User.find(@books.user_id)
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
       flash[:success] = "Book was successfully created."
       redirect_to book_path(@book)
    else
       @user = current_user
       @books = Book.all
       render :index
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
    flash[:success] = "Book was successfully updated."
    redirect_to book_path(@book.id)
    else
    render :"books/edit"
    end
  end

  def destroy
      @book = Book.find(params[:id])
      @book.destroy
      flash[:success] = "Book was successfully destroyed."
      redirect_to books_path
  end

  def edit
      @book = Book.find(params[:id])
  end



  private

  def book_params
    params.require(:book).permit(:title, :body, :opinion, :profile_image)
  end
end

