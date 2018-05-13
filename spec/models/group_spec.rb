require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#email' do
    it { expect validate_presence_of(:group_name) }
  end
  describe 'last_message_body' do
    let(:user) { create(:user) }
    let(:group) { user.groups.first }
    subject { group.last_message_body }
    context 'exist message' do
      context 'text' do
        before do
          create(:message, body: 'test', image: nil, user: user, group: group)
        end
        it 'returns message' do
          is_expected.to eq 'test'
        end
      end
      context 'image' do
        before do
          create(:message, body: nil, user: user, group: group)
        end
        it 'returns message about image' do
          is_expected.to eq 'Image was uploaded'
        end
      end
    end
    context "doesn't exist message" do
      it 'returns no message' do
        is_expected.to eq 'No message'
      end
    end
  end
end
