class AddLastOnlineToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :last_online, :timestamp, :default => Time.now
  end
end
