class AddIndexToUsersEmailAndNickname < ActiveRecord::Migration[7.0]
  def change
    unless index_exists?(:users, :email)
      add_index :users, :email, unique: true
    end

    unless index_exists?(:users, :nickname)
      add_index :users, :nickname, unique: true
    end
  end
end
