class BooksController < ApplicationController
    before_action :authenticate_user!

    def new
  	    @book = Book.new
    end

    def index
        @books = Book.all
        @book = Book.new

    end

    def show
    	@book = Book.find(params[:id])
    end

    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        @user = current_user
        @books = Book.all
        if @book.save
        redirect_to book_path(@book.id)
        flash[:notice] = "successfully"
        else
        render 'users/show'
    end

    end



    def edit
        @book = Book.find(params[:id])
    end

    def update
    	book = Book.find(params[:id])
    	book.update(book_params)
    	redirect_to book_path(book.id)
    end

    def destroy
    	book = Book.find(params[:id])
    	book.destroy
    	redirect_to books_path
    end


    def book_params
        params.require(:book).permit(:title, :opinion, :profile_image, :user_id)
    end


end
