class CreateFlowers < ActiveRecord::Migration[6.0]
  def change
    create_table :flowers do |t|
      t.string :name
      t.string :color
      t.integer :owner_id
      t.integer :floristry_id
    end
  end
end
