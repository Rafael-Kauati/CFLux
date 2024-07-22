class User < ApplicationRecord
    has_secure_password
    
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
    normalizes :email, with: ->(email) { email.strip.downcase }
    
    validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/ }
end