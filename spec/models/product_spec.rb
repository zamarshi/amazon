require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'validations' do

    it 'requires a title' do
      #GIVEN
      #
      # p = Product.new title: nil
      p = FactoryGirl.build :product,  title: nil
      #WHEN
      p.valid?
      #THEN
      expect(p.errors).to have_key(:title)
    end

    it 'requires a price' do
      #GIVEN
      p = FactoryGirl.build :product, price: nil
      #WHEN
      p.valid?
      #THEN
      expect(p.errors).to have_key(:price)
    end
  #
    it 'requires a unique title' do
      #GIVEN
      FactoryGirl.create :product, title: "Thaisa Marinho"
      p = Product.new title: "Thaisa Marinho", price: 15
      #WHEN
      p.valid?
      #THEN
      expect(p.errors).to have_key(:title)
    end
  #
    it 'requires a sale_price' do
      #GIVEN
      p = FactoryGirl.create :product, {title: "hello world", price: 10}
      # byebug
      #WHEN
      # p.sale_price
      #THEN
      expect(p.sale_price).to be_equal(p.price)
    end
  #
    it 'requires sale price less than or equal to price' do
      #GIVEN
      p = FactoryGirl.build :product, sale_price: 200
      #WHEN
      p.valid?
      #THEN
      expect(p.errors).to have_key(:sale_price)
    end

    it 'requires product on sale' do
      p = FactoryGirl.build :product, sale_price: 1
      expect(p.on_sale?).to be(true) 
    end
  #
  end
end
