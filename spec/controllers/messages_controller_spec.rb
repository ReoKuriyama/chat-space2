require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  context 'Logined' do
    before do
      login_user user
      @group = user.groups.first
    end

    describe 'GET #index' do
      before do
        get :index, params: { group_id: @group.id }
      end

      it 'assigns the requested message to @message' do
        expect(assigns(:message)).to be_a_new Message
      end

      it 'assigns the requested group to @group' do
        expect(assigns(:group)).to eq @group
      end

      it 'assigns the requested groups to @groups' do
        groups = user.groups
        expect(assigns(:groups)).to eq groups
      end

      it 'renders the :index template' do
        expect(response).to render_template :index
      end
    end

    describe 'GET #create' do
      context 'invalid message' do
        before do
          get :create, params: { group_id: @group.id, message: { body: nil } }
        end

        it "doesn't save the new contact in the database" do
          expect change(Message, :count).by(0)
        end

        it 'renders the :index template' do
          expect(response).to render_template :index
        end
      end
      context 'valid message' do
        it 'saves the new contact in the database' do
          @params = { group_id: @group.id, message: { body: 'test' } }
          expect { get :create, params: @params }.to change(Message, :count).by(1)
        end
      end
    end
  end

  context 'not logined' do
    describe 'GET #index' do
      before do
        @group = user.groups.first
        get :index, params: { group_id: @group.id }
      end

      it 'redirect to user_session_path' do
        get :index, params: { group_id: @group.id }
        expect(response).to redirect_to user_session_path
      end
    end
  end
end
