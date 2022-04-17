class UsersController < ApplicationController
  def show

  end

  def edit
  end

  def index
    @book = Book.new
    @books = Book.all
  end
end
