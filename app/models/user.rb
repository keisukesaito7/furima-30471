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
    validates :first_name,      format: { with: zenkaku, message: 'は全角で入力してください' }
    validates :last_name,       format: { with: zenkaku, message: 'は全角で入力してください' }
    validates :first_name_kana, format: { with: zenkaku_kana, message: 'は全角（カナ）で入力してください' }
    validates :last_name_kana,  format: { with: zenkaku_kana, message: 'は全角（カナ）で入力してください' }
    validates :birth_date,      format: { with: birthday }
  end
  validates :password, format: { with: eng_num, message: 'は英数字混合で入力してください' }

  has_many :items
  has_many :orders
  has_many :comments
end
