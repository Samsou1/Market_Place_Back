class CreateApartments < ActiveRecord::Migration[7.0]
  def change
    create_table :apartments do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :address
      t.string :city
      t.string :postal_code
      t.integer :surface
      t.boolean :furnished
      t.boolean :garden
      t.boolean :basement
      t.boolean :custodian
      t.belongs_to :user, class_name: "user", foreign_key: "user_id"

      t.timestamps
    end
  end
end
