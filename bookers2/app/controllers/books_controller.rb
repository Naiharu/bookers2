class BooksController < ApplicationController
    before_action :authenticate_user!, except: [:top]

  def top
  end
  def new
  	@book = Book.new
    @books = Book.all
  end 

  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id), notice:"Book was successfully created"
     else
      redirect_to books_path
      end
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
    @users = User.all
  end

  def show
    if Book.exists?(id: params[:id])
    @book = Book.new
    @bookr = Book.find(params[:id])
    @users = User.all
  else
    redirect_to top_path
  end
  end

  def edit
    @book = Book.find(params[:id])
     if @book.user_id != current_user.id
      redirect_to books_path
    end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id), notice: "Book was successfully updated."
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "Book was successfully destroyed."
  end

  private
  	def book_params
  		params.require(:book).permit(:title, :category, :user_id)
	end
end
