require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、passwordとpassword_confiramation,first_name,last_name,first_name_kana,last_name_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上の半角英数字混合であれば登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
      it 'last_nameが全角文字であれば登録できる' do
        @user.last_name = '山田'
        expect(@user).to be_valid
      end
      it 'first_nameが全角文字であれば登録できる' do
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
      it 'last_name_kanaが全角カナであれば登録できる' do
        @user.last_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角カナであれば登録できる' do
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録が上手くいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00aaa'
        @user.password_confirmation = '000aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは数字のみでは登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは半角英数字以外では登録できない' do
        @user.password = 'AAAAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameは全角（ひらがな・カタカナ・漢字）でないと登録できない' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameは全角（ひらがな・カタカナ・漢字）でないと登録できない' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaは全角（カタカナ）でないと登録できない' do
        @user.last_name_kana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'first_name_kanaは全角（カタカナ）でないと登録できない' do
        @user.first_name_kana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
