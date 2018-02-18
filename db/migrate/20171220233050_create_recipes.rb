class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.text :ingredients
      t.integer :level
      t.integer :time
      t.string :modifications
      t.text :text
      t.string :links
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
