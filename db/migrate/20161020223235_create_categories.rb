class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.text :title
      #t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
