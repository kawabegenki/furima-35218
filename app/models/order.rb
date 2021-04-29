class Order < ApplicationRecord
# Association
belongs_to :history
attr_accessor :token

# バリデーション
validates :postal_cord  
validates :pay_from      
validates :city          
validates :addresses     
validates :building   
validates :phone_number     

end
