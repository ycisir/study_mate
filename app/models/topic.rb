class Topic < ApplicationRecord
  has_many :rooms, dependent: :destroy
  validates :name, presence: true, format: { with: /\A[A-Z]/}
end
