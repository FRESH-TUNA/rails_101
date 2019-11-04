class AddParentToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :parent, :integer
    add_foreign_key :comments, :comments, column: :parent
  end
end
