class CreateMobilities < ActiveRecord::Migration[6.1]
  def change
    create_table :mobilities do |t|
      t.string :ride_type
      t.string :uid
      t.float :impulse
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
