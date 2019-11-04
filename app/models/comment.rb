class Comment < ApplicationRecord
  # belongs_to :commentable, polymorphic: true
  # belongs_to :parent, class_name: 'Comment', optional: true
  # has_many :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
  belongs_to :post
  has_many :comments
  belongs_to :comment
end

=begin

post = Post.find(2)

comments = post.comments
# Comment.where(post_id: 2)

comments.each do |comment|
  replies = comment.comments
  # Comment.where(comment_id: comment.id)
end

=end