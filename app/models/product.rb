class Product < ApplicationRecord
  # Вновь добавить/изменить предел поля и запрос
  validates :title, presence: { message: "Пожалуйста, введите название продукта" }
  validates :price, presence: { message: "Пожалуйста, введите цену продукта" }
  validates :price, numericality: { greater_than: 0, message: "Пожалуйста, введите цену продукта, он должен быть больше нуля" }
  validates :quantity, presence: { message: "Пожалуйста, введите количество запасов" }, numericality: { greater_than_or_equal: 0 }
  validates :category_id, presence: { message: "Пожалуйста, выберите категорию подразделения продукта" }
  validates :brand_id, presence: { message: "Пожалуйста, выберите бренд продукта" }

  belongs_to :category
  belongs_to :brand
  has_one :product_list
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images
  has_many :wish_lists
  has_many :wish_list_owners, :through => :wish_lists, :source => :user
  has_many :product_color_relationships
  has_many :colors, :through => :product_color_relationships, :source => :color
  accepts_nested_attributes_for :colors

  def hidden?
    is_hidden
  end

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  def to_param
    "#{self.id}-#{self.title.gsub(/\s+/, "")}"
  end

  
  def chosen!
    self.is_chosen = true
    self.save
  end

  def no_chosen!
    self.is_chosen = false
    self.save
  end

  # Scope
  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at DESC') }
  scope :random3, -> { limit(3).order('RANDOM()') }
end
