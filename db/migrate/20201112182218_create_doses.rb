class CreateDoses < ActiveRecord::Migration[6.0]
  def change
    create_table :doses do |t|
      t.string :description
      t.reference :cocktail
      t.reference :ingredient

      t.timestamps
    end
  end
end
