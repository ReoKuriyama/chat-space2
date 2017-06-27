require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }

  # userをcreateし、let内に格納

  describe 'GET #index' do
    before do
      login_user user
      # controller_macros.rb内のlogin_userメソッドを呼び出し
    end

    it "assigns the requested group to @group" do
      get :index, params: {group_id: group}
      expect(assigns(:group)).to eq group
    end

    it "renders the :index template" do
      get :index, params: {group_id: group}
      expect(response).to render_template :index
    end
  end

  describe 'Get #create' do
    before do
      login_user user
      # controller_macros.rb内のlogin_userメソッドを呼び出し
    end

    describe 'GET #create' do
      it 'returns http success' do
        get :create, params: {group_id: group, message: {body: "sample"}}
        expect(response).to redirect_to( group_messages_path)
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
