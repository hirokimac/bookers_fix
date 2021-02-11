class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new
  end
  
  def show
    @book = Book.new    
    @books = Book.find(params[:id])
    @user = User.find(@books.user_id)
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "successfully created book!"
    else
      @book.errors.full_messages
      @user = User.find(current_user.id)
      @books = Book.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @book.update()
      redirect_to book_path(@book), notice: "successfully updated book!"
    else
      render 'edit'
    end
  end

  def destroy
  	@book.destroy
  	redirect_to books_path, notice: "successfully delete book!"
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
