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

    it 'should not save when missing a name' do
      @product_params[:name] = nil
      @product = Product.new(@product_params)
      @product.save

      expect(@product.id).not_to be_present
      expect(@product.errors.full_messages).to include("Name can't be blank")  
    end

    it 'should not save when missing a price' do
      @product_params[:price] = nil
      @product = Product.new(@product_params)
      @product.save

      expect(@product.id).not_to be_present
      expect(@product.errors.full_messages).to include("Price can't be blank")  
    end

    
  end
end
