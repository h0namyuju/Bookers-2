class UsersController < ApplicationController
before_action :ensure_current_user, {only: [:edit]}


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
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path (@user.id)
  else
    render "users/edit"
  end
  end

  def ensure_current_user
     @user = User.find(params[:id])
     if current_user.id != @user.id
     redirect_to user_path(current_user)
     end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)


  end
end
