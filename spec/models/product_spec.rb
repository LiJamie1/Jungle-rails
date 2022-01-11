require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation' do
    before { 
      @category = Category.new(name: 'test')
      @product_params = { 
        name: 'Apple',
        price: '10000',
        quantity: '5',
        category: @category
       }
     }

     it 'should successfully save when all fields are valid' do
      @product = Product.new(@product_params)
      @product.save
      expect(@product.id).to be_present
    end
  end
end
