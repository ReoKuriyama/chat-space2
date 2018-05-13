require 'rails_helper'

describe GroupsController, type: :controller do
  let(:user) { create(:user) }
  context 'Logined' do
    before do
      login_user user
    end

    describe 'GET #new' do
      before do
        get :new
      end
      it 'assigns the requested group to @group' do
        expect(assigns(:group)).to be_a_new Group
      end
    end
    describe 'GET #create' do
      before do
        get :create, params: { group: { group_name: 'test', user_ids: [user.id] } }
      end
      it 'saves the new contact in the database' do
        expect change(Group, :count).by(1)
      end
      it 'redirect_to root_path' do
        expect(response).to redirect_to root_path
      end
    end
  end

  context 'not logined' do
  end
end
