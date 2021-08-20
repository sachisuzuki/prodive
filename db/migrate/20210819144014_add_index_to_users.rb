class AddIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, [:uid, :provider], unique: true
  end
end
