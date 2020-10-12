require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '#create' do
    before do
      @order = FactoryBot.build(:item_order)
    end

    it '全ての値が正しく入力されると保存できる' do
      expect(@order).to be_valid
    end

    it 'buildingは入力されなくとも保存できる' do
      @order.building = nil
      expect(@order).to be_valid
    end

    it 'postal_codeが空だと保存できない' do
      @order.postal_code = nil
      @order.valid?
      # expect(@order.errors.full_messages).to include("Postal code can't be blank")
      expect(@order.errors.full_messages).to include('郵便番号を入力してください')
    end

    it 'postal_codeは[***-****]の形でないと保存できない' do
      @order.postal_code = '1234567'
      @order.valid?
      # expect(@order.errors.full_messages).to include('Postal code is invalid')
      expect(@order.errors.full_messages).to include('郵便番号を正しく入力してください')
    end

    it 'postal_codeが全角数字で入力されると保存できない' do
      @order.postal_code = '１２３-２３４５'
      @order.valid?
      # expect(@order.errors.full_messages).to include('Postal code is invalid')
      expect(@order.errors.full_messages).to include('郵便番号を正しく入力してください')
    end

    it 'prefecture_idが空だと保存できない' do
      @order.prefecture_id = nil
      @order.valid?
      # expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      expect(@order.errors.full_messages).to include('都道府県を入力してください')
    end

    it 'prefecture_idが選択されないと保存できない' do
      @order.prefecture_id = 1
      @order.valid?
      # expect(@order.errors.full_messages).to include('Prefecture Select')
      expect(@order.errors.full_messages).to include('都道府県を選択してください')
    end

    it 'cityが空だと保存できない' do
      @order.city = nil
      @order.valid?
      # expect(@order.errors.full_messages).to include("City can't be blank")
      expect(@order.errors.full_messages).to include('市区町村を入力してください')
    end

    it 'addressesが空だと保存できない' do
      @order.addresses = nil
      @order.valid?
      expect(@order.errors.full_messages).to include('番地を入力してください')
    end

    it 'phone_numberが空だと保存できない' do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include('電話番号を入力してください')
    end

    it 'phone_numberが12桁以上だと保存できない' do
      @order.phone_number = '123456789012'
      @order.valid?
      expect(@order.errors.full_messages).to include('電話番号を正しく入力してください')
    end

    it 'phone_numberが全角数字で入力されると保存できない' do
      @order.phone_number = '１２３４５６７８９０１'
      @order.valid?
      expect(@order.errors.full_messages).to include('電話番号を正しく入力してください')
    end

    it 'user_idが空だと保存できない' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include('ユーザーを入力してください')
    end

    it 'item_idが空だと保存できない' do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include('商品を入力してください')
    end

    it 'tokenが空だと保存できない' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include('クレジットカード情報を入力してください')
    end
  end
end
