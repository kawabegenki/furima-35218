class Item < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category,:state,:charge,:from,:move
  
  #バリデーション
  with_options  numericality: { other_than: 1 } do
    validates :category_id 
    validates :state_id
    validates :charge_id
    validates :from_id 
    validates :move_id
  end
# タイトルなど特殊バリデーションは最後
  validates :image     , presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

end
