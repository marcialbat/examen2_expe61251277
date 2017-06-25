class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_autor, :authenticate
  before_action :authenticate

  def login(autor)
  	session[:autor_id] = autor.id
  	redirect_to book_autor_path(autor.id)
  end

  def logout
  	reset_session
  	redirect_to root_path
  end

  def current_autor
    if session[:autor_id]
      @current_autor = Autor.find(session[:autor_id])
    end
  end

  def authenticate
    unless current_autor
      redirect_to root_path
    end
  end
end