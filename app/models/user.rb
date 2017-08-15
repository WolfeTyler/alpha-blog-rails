class User < ActiveRecord::Base

    has_secure_password
    has_many :articles, dependent: :destroy
    before_save { self.email = email.downcase }
    
    validates :user_name, presence: true, 
                        length: { minimum: 2, maximum: 25}, 
                        uniqueness: { case_sensitive: false}
    
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # validates :email presence: true, length: { minimum: 5, maximum: 150}, 
    #     uniqueness: { case_sensitive: false}, format: { with: VALID_EMAIL_REGEX }
end