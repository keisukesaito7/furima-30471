require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'comment#create' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    it 'コメントが正しく入力されれば保存できる' do
      expect(@comment).to be_valid
    end

    it 'textが空だと保存できない' do
      @comment.text = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Text can't be blank")
    end

    it 'textが101文字以上だと保存できない' do
      @comment.text = Faker::Lorem.characters(number: 101)
      @comment.valid?
      expect(@comment.errors.full_messages).to include('Text is too long (maximum is 100 characters)')
    end

    it 'userが紐づいていなければ保存できない' do
      @comment.user = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('User must exist')
    end

    it 'itemが紐づいていなければ保存できない' do
      @comment.item = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('Item must exist')
    end
  end
end
