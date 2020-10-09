class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  eng_num = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  zenkaku = /\A[ぁ-んァ-ン一-龥]+\z/
  zenkaku_kana = /\A[ァ-ン]+\z/
  birthday = /\A\d{4}-\d{2}-\d{2}\z/
  with_options presence: true do
    validates :nickname
    validates :first_name,      format: { with: zenkaku }
    validates :last_name,       format: { with: zenkaku }
    validates :first_name_kana, format: { with: zenkaku_kana }
    validates :last_name_kana,  format: { with: zenkaku_kana }
    validates :birth_date,      format: { with: birthday }
  end
  validates :password, format: { with: eng_num }

  has_many :items
  has_many :orders
  has_many :comments
end
