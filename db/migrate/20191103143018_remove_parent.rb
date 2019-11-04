class RemoveParent < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :parent
  end
end
