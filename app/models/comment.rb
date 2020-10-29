class Comment < ApplicationRecord
    belongs_to :gossip
    belongs_to :user, optional: true
end
