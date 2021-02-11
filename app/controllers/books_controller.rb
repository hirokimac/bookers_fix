class BooksController < ApplicationController

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
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @book.errors.full_messages
      @user = User.find(current_user.id)
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id
      redirect_to books_path
  end
end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "successfully updated book!"
    else
      @book.errors.full_messages
      render 'edit'
    end
  end

  def destroy
  	@book.destroy
  	redirect_to books_path, notice: "successfully delete book!"
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
