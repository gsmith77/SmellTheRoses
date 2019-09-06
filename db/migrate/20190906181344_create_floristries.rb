class CreateFloristries < ActiveRecord::Migration[6.0]
  def change
    create_table :floristries do |t|
      t.string :name
    end
  end
end
