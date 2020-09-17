class BooksController < ApplicationController
  
  layout false

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to(books_path)
    else
      render("add_book") 
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      redirect_to(books_path(@book))
    else
      render("index") 
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def delete
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to(books_path)
    else
      render("index")
    end
  end

  def destroy
  end

  def book_params
    params.require(:book).permit(:id,:title,:author,:genre,:price,:published_date)
  end
end
