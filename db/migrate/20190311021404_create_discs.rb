class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.string :make
      t.string :model
      t.string :disc_type
      t.string :plastic
      t.float :dc_flight
      t.integer :nova_speed
      t.integer :nova_glide
      t.integer :nova_turn
      t.integer :nova_fade

      t.timestamps
    end
  end
end
