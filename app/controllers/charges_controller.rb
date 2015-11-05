class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 500
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :card  => params[:stripeToken]
    )
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Buy "What is Ruby on Rails"',
      :currency    => 'usd'
    )
    invite_user(params[:stripeEmail])
    flash[:notice] = 'You are successfully charged. An invitation link is sent to you for sign up.'
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end


  private

  def invite_user user_email
    @user = User.invite!(:email => user_email)
  end

end
