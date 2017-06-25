class AutorsController < ApplicationController
  skip_before_action :authenticate

  def new
    @autor = Autor.new
  end

  def create
    @autor = Autor.new(autor_params)

    if @autor.save
      login(@autor)
      AutorMailer.signup_email(@autor).deliver
    else
      render :new
    end
  end

  def book
    @books = Book.where(["autor_id = ?", current_autor.id])
  end

  protected

  def autor_params
    params.require(:autor).permit!
  end
end
