class CreateBooksUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :books, :users do |t|
      t.boolean :read, default: false
      t.index [:book_id, :user_id]
    end
  end
end
