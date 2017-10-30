class AddLikesToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :likes, :integer, default: 0
    add_column :messages, :dislikes, :integer, default: 0
  end
end
