require 'rails_helper'

describe MessagesController, type: :controller do
  let(:message) { create(:message) }
  let(:user) { create(:user) }
  let(:group) { create(:group) }

  describe 'logined' do
    before do
      login_user user
    end

    describe 'GET #index' do
      before do
        get :index, params: {group_id: group}
      end

      it "assigns the requested group to @message" do
        message = Message.new
        expect(assigns(:message)).to be_a_new Message
      end

      it "assigns the requested group to @group" do
        expect(assigns(:group)).to eq group
      end

      it "assigns the requested groups to @groups" do
        groups = user.groups
        expect(assigns(:groups)).to match(groups)
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end

    describe 'GET #create' do
      it 'returns http success' do
        get :create, params: {group_id: group, message: {body: "sample"}}
        expect(response).to redirect_to( group_messages_path)
      end

      it "saves the new contact in the database" do
        expect{
          post :create, params: {message: attributes_for(:message), group_id: group.id}}.to change(Message, :count).by(1)
        end

      it 'message failed' do
        get :create, params: {group_id: group, message: {body: nil}}
        expect(response).to render_template :index
      end
    end
  end


  describe 'Redirect to user_session_path' do
    it "redirect to user_session_path" do
      get :index, params: {group_id: group}
      expect(response).to redirect_to user_session_path
    end

    it "Redirect to user_session_path" do
      get :create, params: {group_id: group}
      expect(response).to redirect_to user_session_path
    end
  end
end
