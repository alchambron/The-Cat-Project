class AddUserForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key(:orders, :users, column: :user_id)
  end
end
