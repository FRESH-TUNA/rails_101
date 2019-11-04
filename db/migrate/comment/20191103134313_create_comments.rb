class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :content
      t.references :post
      t.references :comment
      t.timestamps
    end
  end
end

# add_foriegn_key
# 다른 db에서 마이그레이션시 주로 사용

# add_references
# 일반적으로 많이 사용: index, belongs_to 추가하기

#개발시에는 마이그레이션 신경쓰지 말고 하자