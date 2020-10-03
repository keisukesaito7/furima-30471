require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'resistrations#create' do
    it '全てのカラムが指定通り記入されると保存できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空だと保存できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空だと保存できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@がないと保存できない' do
      @user.email = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'emailが重複していると保存できない' do
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      @user.save
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空だと保存できない' do
      @user.password = nil
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下だと保存できない' do
      @user.password = '123ab'
      @user.password_confirmation = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角数字のみの場合、保存できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが半角英字のみの場合、保存できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordに値があってもpassword_confirmationが空だと保存できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとpassword_confirmationの値が異なると保存できない' do
      @user.password = '123abc'
      @user.password_confirmation = '789xyz'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '本名（名字）が空だと保存できない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it '本名（名字）は全角で入力しないと保存できない' do
      @user.last_name = 'saito'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it '本名（名前）が空だと保存できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it '本名（名前）は全角で入力しないと保存できない' do
      @user.first_name = 'keisuke'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it '本名（名字フリガナ）が空だと保存できない' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it '本名（名字フリガナ）は全角（カナ）で入力しないと保存できない' do
      @user.last_name_kana = 'さいとう'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end

    it '本名（名前フリガナ）が空だと保存できない' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it '本名（名前フリガナ）は全角（カナ）で入力しないと保存できない' do
      @user.first_name_kana = 'けいすけ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it '生年月日が空だと保存できない' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
