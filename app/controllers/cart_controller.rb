require 'pry'
class CartController < ApplicationController
  def list_items
    @items = []
    return if session[:cart].nil? || session[:cart].length == 0

    # On récupère depuis la base tous les items correspondants à ceux ajoutés au panier
    @items = Item.find(session[:cart])
  end

  def add_item
    return if params[:id].nil?

    # Si le panier n'a pas encore été initialisé, on l'initialise
    session[:cart] = [] if session[:cart].nil?
    # On ajoute l'item_id voulu à la liste déjà existante (ou pas) dans le panier
    session[:cart] << params[:id]
  end

  def delete_item
    return if params[:id].nil?

    # On supprimer l'item_id voulu de la liste du panier
    session[:cart] = session[:cart].reject { |i| i == params[:id] }
    redirect_back(fallback_location: root_path)
  end
end
