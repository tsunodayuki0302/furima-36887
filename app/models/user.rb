class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  #has_many :purchase_records

  validates :name, presence: true
  validates :password, format:{with: /\A[a-zA-Z0-9]+\z/ }
  validates :first_name, presence: true, format:{with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
  validates :last_name, presence: true, format:{with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
  validates :first_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
end
