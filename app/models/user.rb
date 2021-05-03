class User < ApplicationRecord
  # アソシエーション
  has_many :items
  has_many :histories

  # バリデーション
  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  validates :password, presence: true,
                       format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze, message: 'に半角英数字を使用してください' }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/.freeze, message: 'に全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/.freeze, message: 'はカタカナで入力して下さい。' } do
    validates :first_read
    validates :last_read
  end

  # デバイス
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
