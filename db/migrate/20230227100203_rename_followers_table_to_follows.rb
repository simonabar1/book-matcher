class RenameFollowersTableToFollows < ActiveRecord::Migration[7.0]
  def change
    rename_table :followers, :follows
  end
end
