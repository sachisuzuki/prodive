# frozen_string_literal: true

class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.string :divepoint, null: false, default: ''
      t.integer :status, null: false, default: 0
      t.integer :temperature
      t.integer :visibility
      t.text :content
      t.text :image
      t.references :user, foreign_key: true
      t.references :divesite, foreign_key: true
      t.timestamps
    end
    add_index :conditions, :status
  end
end
