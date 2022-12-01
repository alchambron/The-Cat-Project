class CheckoutController < ApplicationController
  # create session stripe
  def create
    @user = current_user
    @total = params[:total].to_d # montant total
    @session = Stripe::Checkout::Session.create( # session de paiement
      payment_method_types: ['card'],
      line_items: [
        {
          name: 'Rails Stripe Checkout',
          amount: (@total*100).to_i,
          currency: 'eur',
          quantity: 1
        }
      ],
      # défini les sessions
      succes_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}', # ajout de l'ID de la session
      cancel_url: checkout_cancel_url
    )

    respond_to do |format|
      # renders create.js.erb
      format.js # dans cette page create injecte moi du javascript
    end
  end

  def success
    
    # extrait moi les infos de la session
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    # extrait moi les infos par rapport au montant qui a réelement payé lors de cette session
    @payment_intent = Stripe::PaymentIntent.retrieve
  end

  def cancel
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve
  end
end
