class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :author_id
      t.integer :publisher_id
      t.integer :written_date
      t.integer :publish_date
      t.integer :price
    end
  end
end
