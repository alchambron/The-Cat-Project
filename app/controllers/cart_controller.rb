class CartController < ApplicationController
  def list_items
    # On récupère depuis la base tous les items correspondants à ceux ajoutés au panier
    @items = Item.find(session[:cart])
  end

  def add_item(item_id)
    # Si le panier n'a pas encore été initialisé, on l'initialise
    session[:cart] = [] if session[:cart].nil?
    # On ajoute l'item_id voulu à la liste déjà existante (ou pas) dans le panier
    session[:cart] << item_id
  end

  def delete_item(item_id)
    # On supprimer l'item_id voulu de la liste du panier
    session[:cart] = session[:cart].reject { |i| i == item_id }
  end
end
