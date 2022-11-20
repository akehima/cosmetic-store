class Brand < ApplicationRecord
  validates :name, presence: true
  has_many :products

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  # Scope
  scope :published, -> { where(is_hidden: false) }

  mount_uploader :logo, ImageUploader
end
