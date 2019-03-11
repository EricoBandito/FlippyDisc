class CreatePlastics < ActiveRecord::Migration[5.2]
  def change
    create_table :plastics do |t|
      t.string :type

      t.timestamps
    end
  end
end
