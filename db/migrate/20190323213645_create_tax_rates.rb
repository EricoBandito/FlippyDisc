class CreateTaxRates < ActiveRecord::Migration[5.2]
  def change
    create_table :tax_rates do |t|
      t.string :province
      t.string :name
      t.float :rate

      t.timestamps
    end
  end
end
