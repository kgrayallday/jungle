require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  
  # SETUP
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

  scenario "They click on the first product" do
    # ACT
    visit root_path
    
    find('main').find('section').find('div').first('article').find('header').find('a').click

    # DEBUG / VERIFY
    save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product-detail', count: 1
  end




end
