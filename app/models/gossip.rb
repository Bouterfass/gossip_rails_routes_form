class Gossip < ApplicationRecord
    
    validates :title, 
        presence: true,
        format: {with: /\A.{3,14}\z/, message: "title too long or too short"}

    validates :content, presence: true

    belongs_to :user

    has_many :comments

    has_many :likes, dependent: :destroy
    has_many :linktags
    has_many :tags, through: :linktags

end
