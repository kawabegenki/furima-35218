class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string     :postal_cord  ,null: false, default: ""
      t.string     :pay_from     ,null: false, default: ""
      t.string     :city         ,null: false, default: ""
      t.string     :addresses    ,null: false, default: ""
      t.string     :building     ,null: false, default: ""
      t.string     :phone_number ,null: false, default: ""
      t.references :history      ,foreign_key: true
      t.timestamps
    end
  end
end
