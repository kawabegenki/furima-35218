class Item < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :charge
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :from
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :move

  # バリデーション
  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :state_id
    validates :charge_id
    validates :from_id
    validates :move_id
  end

  with_options presence: true do
    validates :title
    validates :content
    validates :image
    validates :price, numericality: true, inclusion: { in: 300..9_999_999, message: 'が範囲を超えています' }, format: { with: /\A[0-9]+\z/ }
  end

  # タイトルなど特殊バリデーションは最後

end
