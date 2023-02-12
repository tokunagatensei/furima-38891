class Item < ApplicationRecord

  validates :image,             presence: true
  validates :name,              presence: true
  validates :description,       presence: true
  validates :category_id,       numericality: { other_than: 1 }
  validates :item_status_id,    numericality: { other_than: 1 }
  validates :shipping_cost_id,  numericality: { other_than: 1 }
  validates :prefecture_id,     numericality: { other_than: 1 }
  validates :shipping_date_id,  numericality: { other_than: 1 }
  validates :price,             presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date
end
