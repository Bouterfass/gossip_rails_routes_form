class User < ApplicationRecord
    belongs_to :city, optional: true
    has_many :gossips

    has_many :sent_messages, foreign_key: 'sender_id', class_name: 'PrivateMessage'
    has_many :received_messages, foreign_key: 'recipient_id', class_name: 'PrivateMessage'

    has_many :comments
    has_many :likes, dependent: :destroy

    validates :email, 
    presence: true,
    format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Email invalid"}

    validates :password, 
    presence: true, 
    length: { minimum: 6 }

    has_secure_password
end
