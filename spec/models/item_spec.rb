require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('/files/item-sample.png')
  end

  describe '商品出品時' do
    context '新規登録できる時' do
      it '全てで入力ができている時登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できる時' do
      it '商品名が必須であること' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '画像が必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品説明が必須であること' do
        @item.content = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it '価格が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が範囲以下だと保存できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price が範囲を超えています')
      end
      it '価格が範囲以上だと登録できない' do
        @item.price = 20_000_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price が範囲を超えています')
      end
      it '価格が数字と文字だと登録できない' do
        @item.price = '2000aaaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が大文字だと登録できない' do
        @item.price = '８８８８８８'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'カテゴリーが未選択だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を選択してください')
      end
      it 'Stateが未選択だと登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State を選択してください')
      end
      it 'Chargeが未選択だと登録できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Charge を選択してください')
      end
      it 'fromが未選択だと登録できない' do
        @item.from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('From を選択してください')
      end
      it 'Moveが未選択だと登録できない' do
        @item.move_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Move を選択してください')
      end
      it 'ユーザーが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
