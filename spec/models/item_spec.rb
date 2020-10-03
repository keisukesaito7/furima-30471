require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての値が存在すれば保存できる' do
      expect(@item).to be_valid
    end

    it 'userが紐づいていないと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end

    it 'imageが空だと保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空だと保存できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'infoが空だと保存できない' do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it 'categoryが選択されていないと保存できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end

    it 'sales_statusが選択されていないと保存できない' do
      @item.sales_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Sales status Select')
    end

    it 'shipping_fee_statusが選択されていないと保存できない' do
      @item.shipping_fee_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee status Select')
    end

    it 'prefectureが選択されていないと保存できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Select')
    end

    it 'scheduled_deliveryが選択されていないと保存できない' do
      @item.scheduled_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Scheduled delivery Select')
    end

    it 'priceが空だと保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceを半角数字で入力しないと保存されない' do
      @item.price = 'number'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be Half-width number')
    end

    it 'priceが半角数字でも300~9,999,999の範囲外だと保存されない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is Out of setting range')
    end
  end
end
