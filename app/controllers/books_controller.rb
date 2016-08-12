class BooksController < ApplicationController
  def new
    @book = Book.new
    @hosts = Host.all
    @users= User.all
  end

  def create
    @book = Book.new book_params
    if @book.save
      redirect_to books_path, notice: "Booking successfully created"
    else
      render 'new'
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :location, :description, :user_id, :host_id )
  end

end
