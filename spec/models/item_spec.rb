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
      # expect(@item.errors.full_messages).to include('User must exist')
      expect(@item.errors.full_messages).to include('ユーザーを入力してください')
    end

    it 'imageが空だと保存できない' do
      @item.image = nil
      @item.valid?
      # expect(@item.errors.full_messages).to include("Image can't be blank")
      expect(@item.errors.full_messages).to include("画像を選択してください")
    end

    it 'nameが空だと保存できない' do
      @item.name = nil
      @item.valid?
      # expect(@item.errors.full_messages).to include("Name can't be blank")
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it 'infoが空だと保存できない' do
      @item.info = nil
      @item.valid?
      # expect(@item.errors.full_messages).to include("Info can't be blank")
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end

    it 'categoryが空だと保存できない' do
      @item.category = nil
      @item.valid?
      # expect(@item.errors.full_messages).to include("Category can't be blank")
      expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
    end

    it 'categoryが選択されていないと保存できない' do
      @item.category_id = 1
      @item.valid?
      # expect(@item.errors.full_messages).to include('Category Select')
      expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
    end

    it 'sales_statusが空だと保存できない' do
      @item.sales_status = nil
      @item.valid?
      # expect(@item.errors.full_messages).to include("Sales status can't be blank")
      expect(@item.errors.full_messages).to include("商品の状態を入力してください")
    end

    it 'sales_statusが選択されていないと保存できない' do
      @item.sales_status_id = 1
      @item.valid?
      # expect(@item.errors.full_messages).to include('Sales status Select')
      expect(@item.errors.full_messages).to include('商品の状態を選択してください')
    end

    it 'shipping_fee_statusが空だと保存できない' do
      @item.shipping_fee_status = nil
      @item.valid?
      # expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
    end

    it 'shipping_fee_statusが選択されていないと保存できない' do
      @item.shipping_fee_status_id = 1
      @item.valid?
      # expect(@item.errors.full_messages).to include('Shipping fee status Select')
      expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
    end

    it 'prefectureが空だと保存できない' do
      @item.prefecture = nil
      @item.valid?
      # expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
    end

    it 'prefectureが選択されていないと保存できない' do
      @item.prefecture_id = 1
      @item.valid?
      # expect(@item.errors.full_messages).to include('Prefecture Select')
      expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
    end

    it 'scheduled_deliveryが空だと保存できない' do
      @item.scheduled_delivery = nil
      @item.valid?
      # expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
    end

    it 'scheduled_deliveryが選択されていないと保存できない' do
      @item.scheduled_delivery_id = 1
      @item.valid?
      # expect(@item.errors.full_messages).to include('Scheduled delivery Select')
      expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
    end

    it 'priceが空だと保存できない' do
      @item.price = nil
      @item.valid?
      # expect(@item.errors.full_messages).to include("Price can't be blank")
      expect(@item.errors.full_messages).to include("販売価格を入力してください")
    end

    it 'priceを半角数字で入力しないと保存できない' do
      @item.price = 'number'
      @item.valid?
      # expect(@item.errors.full_messages).to include('Price must be Half-width number')
      expect(@item.errors.full_messages).to include('販売価格は半角数字で入力してください')
    end

    it 'priceが300未満の場合は保存できない' do
      @item.price = 299
      @item.valid?
      # expect(@item.errors.full_messages).to include('Price is Out of setting range')
      expect(@item.errors.full_messages).to include('販売価格は ¥300〜¥9,999,999の間に設定してください')
    end

    it 'priceが10,000,000以上の場合は保存できない' do
      @item.price = 10_000_000
      @item.valid?
      # expect(@item.errors.full_messages).to include('Price is Out of setting range')
      expect(@item.errors.full_messages).to include('販売価格は ¥300〜¥9,999,999の間に設定してください')
    end
  end
end
