class AddNewParent < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :parent, references: :comments
  end
end
