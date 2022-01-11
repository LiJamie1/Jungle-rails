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

    
  end
end
