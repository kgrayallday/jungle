require 'rails_helper'

RSpec.describe Product, type: :model do

  test_category = Category.new(
    name: 'Health and Beauty'
  )
  
  test_product = Product.new(
    name: 'Joe',
    price_cents: 10000,
    quantity: 11,
    category: test_category
  )

  describe 'Validations' do
    # validation test examples right here
    it 'is valid with name, price, quantity and category' do
      expect(test_product).to be_valid
    end

    it 'is valid if it has a name' do
      expect(test_product[:name]).to eq('Joe')
    end

    it 'is valid if it has a price' do
      expect(test_product[:price_cents]).to eql(10000)
    end

    it 'is valid if it has a quantity' do
      expect(test_product[:quantity]).to eql(11)
    end

    it 'is valid if it has a category' do
      expect(test_category[:name]).to eq('Health and Beauty')
    end

  end






end
