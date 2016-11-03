require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe '#index' do
    it 'render the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
  describe '#show' do
    it 'render the show template' do
      product = create(:product)
      get :show, params: {id: product.id}
      expect(response).to render_template(:show)
    end
    it 'check if the product being rendered is the same as the one i created' do
      product = create(:product)
      get :show, params: {id: product.id}
      expect(assigns(:product)).to eq(product)
    end
  end
  describe '#destroy' do
    it 'render the show page where destroy button in presented' do
      product = create(:product)
      get :show, params: {id: product.id}
      expect(response).to render_template(:show)
    end
    it 'check if product was deleted from database' do
      product = create(:product)
      count_before = Product.count
      delete :destroy, params: {id: product.id}
      count_after = Product.count
      expect(count_before).to eq(count_after + 1)
    end
  end
end
