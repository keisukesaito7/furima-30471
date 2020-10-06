require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe "#create" do
    before do
      @order = FactoryBot.build(:item_order)
    end

    it "全ての値が正しく入力されると保存できる" do
      expect(@order).to be_valid
    end

    it "buildingは入力されなくとも保存できる" do
      @order.building = nil
      expect(@order).to be_valid
    end

    it "postal_codeが空だと保存できない" do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeは[***-****]の形でないと保存できない" do
      @order.postal_code = "1234567"
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid")
    end

    it "postal_codeが全角数字で入力されると保存できない" do
      @order.postal_code = "１２３-２３４５"
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid")
    end

    it "prefecture_idが空だと保存できない" do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    
    it "prefecture_idが選択されないと保存できない" do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture Select")
    end

    it "cityが空だと保存できない" do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end

    it "addressesが空だと保存できない" do
      @order.addresses = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Addresses can't be blank")
    end

    it "phone_numberが空だと保存できない" do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end

    it "phone_numberが12桁以上だと保存できない" do
      @order.phone_number = "123456789012"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
    
    it "phone_numberが全角数字で入力されると保存できない" do
      @order.phone_number = "１２３４５６７８９０１"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
    
    it "user_idが空だと保存できない" do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end

    it "item_idが空だと保存できない" do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end

    it "tokenが空だと保存できない" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
