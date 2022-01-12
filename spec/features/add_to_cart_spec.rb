require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see a product" do
    # ACT
    visit products_path
  
    click_button('Add', match: :first)
  
    # DEBUG / VERIFY
    save_screenshot 'add_to_cart.png'
  
    expect(page).to have_text 'My Cart (1)'
  end
  

end
