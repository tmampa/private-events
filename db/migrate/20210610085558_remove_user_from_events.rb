class RemoveUserFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :user, :reference
  end
end
