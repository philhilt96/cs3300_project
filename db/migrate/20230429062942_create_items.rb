class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :quantity
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
