class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity
      t.boolean :status, :default => false
      t.references :bag, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :items, [:bag_id, :created_at]
  end
end
