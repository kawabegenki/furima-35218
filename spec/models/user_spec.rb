require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '全ての必須項目が存在すれば登録ができる' do
        @user.nickname = 'ttest'
        @user.email    = 'ttest@gmail.jp'
        @user.password = '00000a'
        @user.password_confirmation = '00000a'
        @user.first_name = '青山'
        @user.last_name  = '貴大'
        @user.first_read = 'アオヤマ'
        @user.last_read  = 'タカヒロ'
        @user.birthday   = '1992/04/23'
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'ニックネームがないとき登録ができない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '@が必須であること' do
        @user.email = 'ttestgmail.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが英語だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password に半角英数字を使用してください', "Password confirmation doesn't match Password")
      end
      it '・半角数字のみでは登録できないこと' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password に半角英数字を使用してください', "Password confirmation doesn't match Password")
      end
      it '・全角では登録できないこと' do
        @user.password = 'ＡＡＡＡＡＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password に半角英数字を使用してください', "Password confirmation doesn't match Password")
      end
      it 'パスワードが６文字以上の入力であること' do
        @user.password = 'aaa2a'
        @user.password_confirmation = 'aaa2a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが確認用と一致しない' do
        @user.password = 'aaa2aa'
        @user.password_confirmation = 'aaa2a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー名は苗字が必要であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'ユーザー名は苗字が全角必要であること' do
        @user.first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name に全角文字を使用してください')
      end
      it 'ユーザー名は名前が必要であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'ユーザー名は名前が全角必要であること' do
        @user.last_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name に全角文字を使用してください')
      end
      it 'ユーザー本名の名前のフリガナは、カタカナ以外の全角文字だと登録できないこと' do
        @user.last_read = 'AAA％'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last read はカタカナで入力して下さい。')
      end
      it '空だと登録できない' do
        @user.last_read = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last read can't be blank")
      end
      it 'ユーザー本名の苗字フリガナは、全角（カタカナ）の入力が必須であること' do
        @user.first_read = 'AAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include('First read はカタカナで入力して下さい。')
      end
      it '生年月日が必要であること。' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
