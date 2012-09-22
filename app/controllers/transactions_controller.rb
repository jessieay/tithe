class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(params[:transaction])
    if @transaction.save_with_payment
      redirect_to root_path
      # @transaction, :notice => "Thank you for contributing!"
    else
      render :new
    end
  end
end
