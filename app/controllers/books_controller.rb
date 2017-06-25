class BooksController < ApplicationController

  skip_before_action :authenticate, except: [:new, :create, :edit, :update, :destroy]

  def index
    @books = Book.order(:title)
  end

  def show
    @book = Book.find(params[:id])

  end
 
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    @book.autor_id = current_autor.id
    
    if @book.save
      redirect_to books_path, notice: "Se agrego exitosamente."
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(book_params)
      redirect_to book_path(@book),  notice: "Se edito con exito."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path,  notice: "Se borro con exito."
  end

  protected

  def book_params
    params.require(:book).permit!
  end
end
