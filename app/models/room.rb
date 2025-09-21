class Room < ApplicationRecord

  attr_accessor :topic_name

  belongs_to :user
  belongs_to :topic

  has_many :messages, dependent: :destroy
  has_many :participants, through: :messages, source: :user

  validates :name, presence: true, format: { with: /\A[A-Z]/}
  validates :topic_name, presence: true, format: { with: /\A[A-Z]/}
end
