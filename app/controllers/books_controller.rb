class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @user = @books.user
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
    @user = current_user
    if @book.save
       redirect_to book_path(@book.id), notice: 'Book was successfully created'
    else
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id), notice: 'Book was successfully updated'
    else
    render :edit
    end   
  end

  def users
    @books = Book.all
    @book = Book.new
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path(@book)
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
