class Comment < ActiveRecord::Base
  belongs_to :post

  validates :commenter, presence: true
  validates :body,      presence: true
  validates :post_id,   presence: true
end
