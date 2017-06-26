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

  describe 'Post #edit' do
    before do
      login_user user
      # controller_macros.rb内のlogin_userメソッドを呼び出し
    end

    it "saves the new contact in the database" do
      expect{
        post :create, params: {group_id: group}, message: attributes_for(:message)
      }.to change(Message, :count).by(1)
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
