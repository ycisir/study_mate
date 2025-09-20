class Room < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  has_many :messages
  has_many :participants, through: :messages
end
