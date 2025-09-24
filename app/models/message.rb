class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_one_attached :image

  validate :acceptable_image

  private

  def acceptable_image
    return unless image.attached?

    if image.byte_size > 2.megabytes
      errors.add(:image, "is too big. Maximum size is 2MB.")
    end

    acceptable_types = ["image/jpeg", "image/png", "image/jpg"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, "must be a JPEG or PNG.")
    end
  end

end
