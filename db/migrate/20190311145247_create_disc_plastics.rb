class CreateDiscPlastics < ActiveRecord::Migration[5.2]
  def change
    create_table :disc_plastics do |t|
      t.references :plastic, foreign_key: true
      t.references :disc, foreign_key: true

      t.timestamps
    end
  end
end
