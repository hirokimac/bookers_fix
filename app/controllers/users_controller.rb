class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @book = Book.new
        @books = @user.books
    end

    def index
    end

    def edit
    end

    def update
    end

end
