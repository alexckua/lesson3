class ChangeColumnNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :messages, :likes, :likes_count
    rename_column :messages, :dislikes, :dislikes_count
  end
end
