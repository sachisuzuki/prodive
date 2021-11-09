class CreateDivesites < ActiveRecord::Migration[5.2]
  def change
    create_table :divesites do |t|
      t.integer :area, null: false, default: 0
      t.integer :zone, null: false, default: 0
      t.string :name, null: false, default: ''
      t.string :address, null: false, default: ''
      t.string :phone, null: false, default: ''
      t.string :service, null: false, default: ''
      t.text :discription, null: false, default: ''
      t.float :latitude, null: false, default: 35.6813363998796
      t.float :longitude, null: false, default: 139.76714625537713
      t.timestamps
    end
  end
end
