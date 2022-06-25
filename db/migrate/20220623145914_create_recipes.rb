class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.integer :preparation_time, null: false
      t.integer :cooking_time, null: false
      t.text :description, null: false
      t.boolean :public, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :recipes, [:user_id, :name], unique: true
  end
end
