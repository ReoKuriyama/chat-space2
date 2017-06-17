require 'rails_helper'

describe Message do
  describe 'valid' do
    it "is valid with a body, image" do
      message = build(:message)
      expect(message).to be_valid
    end
    it "is valid with a body" do
      message = build(:message, image: nil)
      expect(message).to be_valid
    end
    it "is valid with a image" do
      message = build(:message, body: nil)
      expect(message).to be_valid
    end
  end

  describe 'invalid' do
    it "is invalid without a group_id" do
      message = build(:message, group_id: nil)
      message.valid?
      expect(message.errors[:group]).to include("must exist")
    end
    it "is invalid without a user_id" do
      message = build(:message, user_id: nil)
      message.valid?
      expect(message.errors[:user]).to include("must exist")
    end
    it "is invalid without a body&image" do
      message = build(:message, body: nil, image: nil)
      message.valid?
      expect(message.errors[:body_or_image]).to include("can't be blank")
    end
  end
end
