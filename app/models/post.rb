class Post < ApplicationRecord
    has_many_attached :images

    validates :images, presence: true
end
