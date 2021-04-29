class Order < ApplicationRecord
  # Association
belongs_to :user
belongs_to :item
has_one    :account

# accounts テーブル

validates :postal_cord  
validates :pay_from      
validates :city          
validates :addresses     
validates :building   
validates :phone_number  
validates :history     

end
