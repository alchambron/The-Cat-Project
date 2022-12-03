class CartController < ApplicationController
  def list_items
    @items = @cart.items
  end

  def add_item
    @cart.add_item(params[:id])
    save_to_session
  end

  def delete_item
    @cart.delete_item(params[:id])
    save_to_session
    # Une fois que l'item a été retiré du panier, on recharge la page appelante pour que les items soient à jour
    redirect_back(fallback_location: root_path)
  end

  def save_to_session
    session[:cart] = @cart
  end
end
