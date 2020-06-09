class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new
  end
  def index
    @user = current_user
  	@users = User.all
  	@book = Book.new
  end 
  def create
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
    @user = User.find(params[:id])
    if @book.save
       redirect_to book_path(@book.id), notice: 'Book was successfully created'
    else
      render templete: "book/index"
    end
  end
  def edit
  	@user = User.find(params[:id])
    @book = Book.new
    unless @user.id == current_user.id
      redirect_to  user_path(current_user)
    end
  end
  def update
  	@user = User.find(params[:id])
    @book = Book.new
    if @user.update(user_params)
       redirect_to user_path(current_user), notice: 'Your informtion was successfully updated'
  	else
       render :edit	
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
