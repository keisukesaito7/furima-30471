class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to             :user
  has_one_attached       :image
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  validates :image,               presence: true
  validates :name,                presence: true
  validates :info,                presence: true
  validates :category,            presence: true
  validates :sales_status,        presence: true
  validates :shipping_fee_status, presence: true
  validates :prefecture,          presence: true
  validates :scheduled_delivery,  presence: true

  validates :category_id,            numericality: { other_than: 1, message: "Select" }
  validates :sales_status_id,        numericality: { other_than: 1, message: "Select" }
  validates :shipping_fee_status_id, numericality: { other_than: 1, message: "Select" }
  validates :prefecture_id,          numericality: { other_than: 1, message: "Select" }
  validates :scheduled_delivery_id,  numericality: { other_than: 1, message: "Select" }

  validates :price, presence: true
  validates :price, numericality: { message: "must be Half-width number" }
  validates :price, inclusion: { in: 300..9999999, message: "is Out of setting range" }
end
