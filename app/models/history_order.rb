class HistoryOrder

  include ActiveModel::Model
  attr_accessor :postal_cord,:pay_from,:city,:addresses,:building,:phone_number,:user_id,:item_id,:token
  
  with_options presence: true do
    validates :postal_cord   
    validates :pay_from     
    validates :city          
    validates :addresses     
    validates :phone_number 
  end


  def save
    # 各テーブルにデータを保存する処理を書く
    # 履歴情報を保存し、変数historyに代入する
    history = History.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    Order.create(postal_cord: postal_cord ,pay_from: pay_from ,city: city, addresses: addresses, building: building, phone_number: phone_number,history_id: history.id)
  end

 end
 