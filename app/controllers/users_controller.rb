class UsersController < ApplicationController

  def top
      @book = Book.new
      @books = Book.all
  end

  def index
      @users = User.all
      @book = Book.new

  end

  def show
      @user = User.find(params[:id])
  	  @book = Book.new
      @books = @user.books

  end

  def edit
  	@user = User.find(params[:id])
    @book = Book.new
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
    redirect_to user_path(@user.id)
    else
    redirect_to edit_user_path(@user)
    flash[:notice] = "error"
  end
  end

  private
def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
end

end
