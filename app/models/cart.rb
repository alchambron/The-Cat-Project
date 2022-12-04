class Cart
  attr_accessor :items_ids

  def self.get(session_cart)
    cart = Cart.new

    cart.items_ids = session_cart['items_ids'] if !session_cart.nil? && !session_cart['items_ids'].nil?
    return cart
  end

  def initialize
    @items_ids = []
  end

  # Récupère depuis la base tous les items correspondants à ceux ajoutés au panier
  def items
    return Item.find(@items_ids)
  end

  # Ajoute l'item au panier
  def add_item(item_id)
    return if item_id.nil?

    @items_ids << item_id
  end

  # Supprime l'item du panier
  def delete_item(item_id)
    return if item_id.nil?

    @items_ids = @items_ids.reject { |i| i == item_id }
  end

  def total_price
    items.map { |i| i.price }
         .reduce(:+)
  end

  def items_count
    return items.length
  end

  def make_empty
    @items_ids = []
  end
end
