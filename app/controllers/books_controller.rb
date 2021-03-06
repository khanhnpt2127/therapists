class BooksController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @book = Book.new
    @hosts = Host.all
    @users= User.all
  end

  def index
    if current_user
      @books = Book.where(user_id: current_user.id)
    else
      @books = Book.where(host_id: current_host.id).delete_expired_books
    end
  end
  
  def create
    @book = Book.new book_params
    if @book.save
      redirect_to books_path, notice: "Booking successfully created"
    else
      render 'new'
    end
  end

  def show
    if current_user
      @books = Book.where(user_id: current_user.id)
    else
      @books = Book.where(host_id: current_host.id)
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :location, :description, :user_id, :host_id, :start_at, :end_at )
  end

end
