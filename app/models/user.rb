class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  eng_num = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  zenkaku = /\A[ぁ-んァ-ン一-龥]+\z/
  zenkaku_kana = /\A[ァ-ン]+\z/
  birthday = /\A\d{4}-\d{2}-\d{2}\z/
  validates :nickname, presence: true
  validates :password,                        format: { with: eng_num }
  validates :first_name,      presence: true, format: { with: zenkaku }
  validates :last_name,       presence: true, format: { with: zenkaku }
  validates :first_name_kana, presence: true, format: { with: zenkaku_kana }
  validates :last_name_kana,  presence: true, format: { with: zenkaku_kana }
  validates :birth_date,      presence: true, format: { with: birthday }

  has_many :items
end
