class Article < ActiveRecord::Base
    validates :title, presence: true, length: { minimum: 2, maximum: 70}
    validates :description, presence: true, length: { minimum: 2, maximum: 400}
end