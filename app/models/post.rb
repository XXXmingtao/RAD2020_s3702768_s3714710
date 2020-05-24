class Post < ApplicationRecord
    validates :title, presence: true, length: { maximum: 255 }
    validates :text, presence: true, length: { maximum: 20000 }
    has_many :comments
    belongs_to :user

    def self.search(search)
        posts = search!="" ? Post.where("LOWER(title) LIKE LOWER(?)","%#{search}%").order('created_at DESC') : nil
    end

end
