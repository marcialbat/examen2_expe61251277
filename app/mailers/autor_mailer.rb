class AutorMailer < ApplicationMailer
	 default from: 'from@example.com'
  def signup_email(autor)
    @autor = autor
    mail( :to => @autor.email,
    :subject => 'Thanks for signing up!' )
  end

  def order_email(autor, order)
    @autor = autor
    @order = order
    mail( :to => @autor.email,
    :subject => 'You have made a new Rent!' )
  end
end
