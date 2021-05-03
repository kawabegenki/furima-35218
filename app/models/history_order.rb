class HistoryOrder
  include ActiveModel::Model
  attr_accessor :postal_cord, :pay_from, :city, :addresses, :building, :phone_number, :user_id, :item_id, :token

  validates :token, presence: true

  with_options presence: true do
    validates :postal_cord, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :pay_from, numericality: { other_than: 1, message: 'を選択してください' }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/.freeze, message: 'に全角文字を使用してください' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    # 履歴情報を保存し、変数historyに代入する
    history = History.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    Order.create(postal_cord: postal_cord, pay_from: pay_from, city: city, addresses: addresses, building: building,
                 phone_number: phone_number, history_id: history.id)
  end
end
