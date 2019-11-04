class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true, null: false
      t.string :name
      t.text :comment
      t.references :comment
      # t.text :content

      t.timestamps
    end
  end
end

# add_foriegn_key
add_index
add_column

add_references