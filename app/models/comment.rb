class Comment < ApplicationRecord
    validates :content, presence: true, length: { maximum: 200 }
    belongs_to :post
    belongs_to :user
    has_one :comment
end
