class OrdersController < ApplicationController

	  skip_before_action :authenticate

  def new
      @book = Book.find(params[:book_id])
      @order = @book.orders.build
  end

  def create
    @book = Book.find(params[:book_id])
    @order = @book.orders.build(orders_params)
    @order.total = @book.price * @order.Quantity	
 
    if @order.save
      OwnerNotifierMailer.order_email(Owner.find_by(id: @book.autor_id), @order).deliver
      redirect_to @book,  notice: "Book: "+@book.title+" Compra de Libro: "+@order.order_end_at.to_formatted_s(:long)+"."
    else
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @order = @book.orders.find(params[:id])
    @order.destroy
    redirect_to @book,  notice: "Se borro con exito."
  end

protected

  def orders_params
        params.require(:order).permit!
  end
end
