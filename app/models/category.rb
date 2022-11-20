class Category < ApplicationRecord
  validates :name, presence: { message: "Пожалуйста, введите название класса продукта" }
  validates :category_group_id, presence: { message: "Пожалуйста, выберите тип категории" }
  belongs_to :category_group
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
