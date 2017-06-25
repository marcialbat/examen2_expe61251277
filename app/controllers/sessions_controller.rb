class SessionsController < ApplicationController
skip_before_action :authenticate

  def new
    if current_autor
      redirect_to root_path
    end
  end

  def create
    password = params[:session][:password]
    email = params[:session][:email]


    @autor = Autor.find_by(email: email)

    if @autor && @autor.authenticate(password)
      login(@autor)
    else
      redirect_to login_path, flash: { error: "Email o Password incorrecto"}
    end
  end

  def show
    @current_autor = current_autor
  end

  def destroy
    logout
  end
end