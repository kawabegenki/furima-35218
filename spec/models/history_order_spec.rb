require 'rails_helper'

RSpec.describe HistoryOrder, type: :model do
  describe '内容に問題がなければ、登録ができる' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('/files/item-sample.png')
      @item.save
      @history_order = FactoryBot.build(:history_order, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@history_order).to be_valid
      end
      it 'buildがからでも保存できること' do
        @history_order.building = ''
        expect(@history_order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では購入できないこと' do
        @history_order.token = ''
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと購入できないこと' do
        @history_order.user_id = ''
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できないこと' do
        @history_order.item_id = ''
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが空だと購入できないこと' do
        @history_order.postal_cord = ''
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Postal cord can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @history_order.postal_cord = '2250003'
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include('Postal cord is invalid')
      end
      it 'pay_fromを選択していないと購入できないこと' do
        @history_order.pay_from = 1
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include('Pay from を選択してください')
      end
      it 'cityは空では購入できないこと' do
        @history_order.city = ''
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("City can't be blank")
      end
      it 'cityは半角では購入できないこと' do
        @history_order.city = 'katushikaku'
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include('City に全角文字を使用してください')
      end
      it 'addressはkaraでは購入できないこと' do
        @history_order.addresses = ''
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberは空では購入できないこと' do
        @history_order.phone_number = ''
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは数字以外では購入できないこと' do
        @history_order.phone_number = 'あああああ'
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは12文字以上では購入できないこと' do
        @history_order.phone_number = '090999999999999'
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは9文字以下では購入できないこと' do
        @history_order.phone_number = '090'
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは英数金剛では購入できないこと' do
        @history_order.phone_number = '090123412aa'
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
