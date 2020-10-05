class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :postal_code,  format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{,11}\z/ }
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
end
