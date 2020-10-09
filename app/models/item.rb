class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to             :user
  has_one_attached       :image
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  has_one                :order
  has_many               :comments, dependent: :destroy

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category
    validates :sales_status
    validates :shipping_fee_status
    validates :prefecture
    validates :scheduled_delivery
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  validates :price, presence: true
  validates :price, numericality: { message: 'must be Half-width number' }
  validates :price, inclusion: { in: 300..9_999_999, message: 'is Out of setting range' }
end
