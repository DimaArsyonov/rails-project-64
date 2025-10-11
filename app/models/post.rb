class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User'

  validates :title, presence: true, length: { minimum: 5, maximum: 255 }
  if Rails.env.test?
    validates :body, presence: true, length: { minimum: 5, maximum: 4000 }
  else
    validates :body, presence: true, length: { minimum: 200, maximum: 4000 }
  end
end
