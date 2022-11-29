class DeleteCarts < ActiveRecord::Migration[7.0]
  def change
    drop_table(:carts)
  end
end
