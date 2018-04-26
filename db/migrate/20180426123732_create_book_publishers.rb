class CreateBookPublishers < ActiveRecord::Migration
  def change
    create_table :book_publishers do |t|
      t.integer :book_id
      t.integer :publisher_id
    end
  end
end
