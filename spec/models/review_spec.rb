require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'star_count' do
    it 'is required' do
      rev = FactoryGirl.build(:review, star_count: 6)
      rev.valid?
      expect(rev.errors).to have_key(:star_count)
    end

  #   it 'is a number between 1 and 5' do
  # end
  end




end
