class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :authors
      t.string :publisher
      t.date :published_date
      t.text :description
      t.string :isbn
      t.integer :page_count
      t.string :print_type
      t.string :categories
      t.float :average_rating
      t.integer :ratings_count
      t.string :language
      t.string :image_link
      t.timestamps
    end
  end
end
