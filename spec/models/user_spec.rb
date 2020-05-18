require 'rails_helper'
describe User do
  describe '#create' do

    it "ニックネーム、メールアドレス、パスワード、確認用パスワード、サイズ、アイコンが存在すれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "ニックネームが空では登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "パスワードが空では登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "パスワードは半角英数字でなければ登録できない" do
      user = build(:user, password: "test１２３４")
      user.valid?
      expect(user.errors[:password]).to include("は半角英数字で入力してください")
    end

    it "確認用パスワードと元のパスワードが一致しなければ登録できない" do
      user = build(:user, password:"0000000", password_confirmation: "1111111")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "パスワードは7文字以上ならば登録できる" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end

    it "パスワードは6文字以下ならば登録できない" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end
end