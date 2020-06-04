class BooksController < ApplicationController
  def index
  end

  def show
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    if @book.save
       redirect_to book_path(@book.id), notice: 'Book was successfully created'
    else
      render :index
    end
  end

  def edit
  end

  def home
    @books = Book.all
  end

  def users
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
end
