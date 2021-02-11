class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @book = Book.new
        @books = @user.books
    end

    def index
        @user = User.find(current_user.id)
        @book = Book.new
        @users = User.all
    end

    def edit
    end

    def update
    end

end
