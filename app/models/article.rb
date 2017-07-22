class Article < ActiveRecord::Base
    
    belongs_to :user
    
    validates :user_id, presence: true
    validates :title, presence: true, length: { minimum: 2, maximum: 70}
    validates :description, presence: true, length: { minimum: 2, maximum: 4000}
end