class ChargesController < ApplicationController


def new
  @parent = Parent.find(params[:parent_id])
  @child = Child.find(params[:child_id])
  # in the future, I'll get a month as an argument
  month = DateTime.now.strftime('%m')
  @months = {"01" => "January", "02" => "February", "03" => "March", "04" => "April", "05" => "May"}
  @current_month = @months[month]
  @current_year = DateTime.now.strftime('%Y')
end

def create
  # Amount in cents
  @parent = Parent.find(params[:parent_id])
  @child = Child.find(params[:child_id])
  @amount = @child.tuition
  Charge.create(:parent_id => @parent.id, :date => DateTime.now.strftime('%Y-%m'), :amount => @amount)
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

def show
  @parent = Parent.find(params[:parent_id])
  @charges = @parent.charges
end


end
