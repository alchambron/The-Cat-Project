class CheckoutController < ApplicationController
    #create session stripe
  def create
    @user = current_user
    @total = params[:total].to_d
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          name: 'Rails Stripe Checkout',
          amount: (@total*100).to_i,
          currency: 'eur',
          quantity: 1
        },
      ],
      succes_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}'
      cancel_url: checkout_cancel_url
    )
    respond_to do |format|
        #renders create.js.erb
        format.js 
    end
  end

  def success                            
    #extrait moi les infos de la session
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    #extrait moi les infos par rapport au montant qui a réelement payé lors de cette session
    @payment_intent = Stripe::PaymentIntent.retrieve
  end

  def cancel                            
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve
  end

end
