class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :book_id
      t.integer :list_id

      t.timestamps
    end
  end
end
