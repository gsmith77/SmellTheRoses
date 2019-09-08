class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :password_digest
      t.string :image
      t.string :uid
    end
  end
end
