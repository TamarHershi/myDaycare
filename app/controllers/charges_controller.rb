class ChargesController < ApplicationController


def new
  @parent = Parent.find(params[:parent_id])
  # in the future, I'll get a month as an argument
  month = DateTime.now.strftime('%Y')
  @months = {"01" => "January", "02" => "February", "03" => "March", "04" => "April", "05" => "May"}
  @current_month = @months[month]
  @current_year = DateTime.now.strftime('%m')
end

def create
  # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end


end
