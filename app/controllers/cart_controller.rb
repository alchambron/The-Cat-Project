class CartController < ApplicationController
  def list_items
    @items = @cart.items
  end

  def add_item
    get_cart.add_item(params[:id])
  end

  def delete_item
    get_cart.delete_item(params[:id])
    # Une fois que l'item a été retiré du panier, on recharge la page appelante pour que les items soient à jour
    redirect_back(fallback_location: root_path)
  end
end
