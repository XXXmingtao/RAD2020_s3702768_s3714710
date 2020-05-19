class Post < ApplicationRecord
    validates :title, presence: true, length: { maximum: 255 }
    validates :text, presence: true, length: { maximum: 20000 }
    has_many :comments
    belongs_to :user
end
