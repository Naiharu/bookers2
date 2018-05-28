class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:about]
	def show
  if User.exists?(id: params[:id])
	@user = User.find(params[:id])
	@book = Book.new
	@books = @user.books
  else
    redirect_to top_path
  end
  end
  
  def index
  @user = current_user
  @book = Book.new
  @users = User.all
  end

  def edit
  	@user =User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  def update
 	@user = User.find(params[:id])
  @user.update(user_params)
  redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
