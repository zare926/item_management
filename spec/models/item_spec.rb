require 'rails_helper'

describe Item, type: :model do
  describe '#create' do
    it "itemの中には必ず、nameが入らないといけない" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "itemの中には必ず、imageが入らないといけない" do
      item = build(:item, image: "")
      item.valid?
      expect(item.errors[:image]).to include("を入力してください")
    end
  end
end