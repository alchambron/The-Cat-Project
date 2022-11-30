class CreateOrderRows < ActiveRecord::Migration[7.0]
  def change
    create_table(:order_rows) do |t|
      t.belongs_to(:order, foreign_key: true)
      t.belongs_to(:item, foreign_key: true)
      t.timestamps
    end
  end
end
