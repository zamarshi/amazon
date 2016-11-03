require 'rails_helper'

RSpec.describe UsersController, type: :controller do
#   describe '#new' do
#     it 'renders the new template' do
#         # this mimicks making a GET request to the UsersController
#         get :new
#         expect(response).to render_template(:new)
#       end
#     it 'sets an instance variable to a new user' do
#       get :new
#         # assigns(:campaign) will test for an instance varialbe: @campaign
#         # be_a_new(Campaign) will match that the instance variable is of class
#         #                    Campaign and it's a non-persisted object
#         expect(assigns(:user)).to be_a_new(User)
#     end
#   describe '#create' do
#     context 'with valid params'do
#     def valid_request
#       post :create, params: { user: FactoryGirl.attributes_for(:user) }
#     end
#
#     it 'creates a user in the db' do
#       before_save = User.count
#       valid_request
#       after_save = User.count
#       expect(before_save).to eq(after_save - 1)
#
#     end
#
#     it 'redirects to the home page' do
#       valid_request
#       expect(response).to redirect_to(root_path)
#
#     end
#
#     it 'signs in the user' do
#
#       # @user1 = FactoryGirl.create(:user)
#       valid_request
#       expect(session[:user_id]).to be()
#     end
#
#
#
#   end
# end


  context 'without valid params' do
      def invalid_request
        post :create, params: {user: FactoryGirl.attributes_for(:user, first_name: nil)}
      end
    it 'renders a new template' do
      invalid_request
      expect(response).to render_template(:new)
    end

    it 'doesn\'t save to the database' do
      before_save = User.count
      invalid_request
      after_save = User.count
      expect(before_save).to eq(after_save)
    end

  end

end
