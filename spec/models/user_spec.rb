require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do

      it 'requires a first name' do
        u = FactoryGirl.build(:user, first_name: nil)
        u.valid?
        expect(u.errors).to have_key(:first_name)
      end

      it 'requires a last name' do
        u = FactoryGirl.build(:user, last_name: nil)
        u.valid?
        expect(u.errors).to have_key(:last_name)
      end

      it 'requires a unique email' do
        u = FactoryGirl.create(:user)
        email = u.email
        q = FactoryGirl.build(:user, email: email)
        q.valid?
        expect(q.errors).to have_key(:email)
      end

      it 'requires full name method to work' do
        u = FactoryGirl.build(:user, first_name: 'zain', last_name: 'amarshi')
        expect(u.full_name).to eq('Zain Amarshi')
      end



    end

end
