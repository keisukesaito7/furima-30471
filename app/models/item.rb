class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to             :user
  has_one_attached       :image
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  validates :name,                presence: true
  validates :info,                presence: true
  validates :category,            presence: true
  validates :sales_status,        presence: true
  validates :shipping_fee_status, presence: true
  validates :prefecture,          presence: true
  validates :scheduled_delivery,  presence: true
  validates :price,               presence: true
  validates :image,               presence: true
  #¥300 ~ ¥9,999,999 の制限は後から
  # inclusion: { in: 300..9999999 }

  validates :category_id,            numericality: { other_than: 1 }
  validates :sales_status_id,        numericality: { other_than: 1 }
  validates :shipping_fee_status_id, numericality: { other_than: 1 }
  validates :prefecture_id,          numericality: { other_than: 1 }
  validates :scheduled_delivery_id,  numericality: { other_than: 1 }
end
