class UsersController < ApplicationController




  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
  end



  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

  if @user.update(user_params)
    flash[:success] = "You have updated user successfully."
    redirect_to user_path (@user.id)
  else
    render :"users/edit"

  end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)


  end
end
