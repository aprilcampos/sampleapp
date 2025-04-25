class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :content, presence: true, length: { minimum: 5, maximimum: 1000 }
  
  broadcasts_to ->(comment) { "blog_#{comment.blog_id}_comments" }, inserts_by: :append
end
