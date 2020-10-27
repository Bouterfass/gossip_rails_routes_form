class Gossip < ApplicationRecord
    belongs_to :user

    has_many :comments

    has_many :linktags
    has_many :tags, through: :linktags
end
