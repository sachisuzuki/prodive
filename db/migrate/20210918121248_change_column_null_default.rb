class ChangeColumnNullDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :avatar, true
    change_column_default :users, :avatar, from: "t", to: ""
  end
end
