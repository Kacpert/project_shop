class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :product, index: true
      t.belongs_to :customer, index: true

      t.timestamps
    end
  end
end
