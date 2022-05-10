require 'rails_helper'

RSpec.describe Product, type: :model do

  # Create a category to build the Product too
  before :each do

    @category = Category.new name: 'Ferns'

  end

  describe 'Validations' do

    it 'has name' do
      @product = Product.new(name: 'Staghorn Fern')
      @product.save
      expect(@product.name).to be_present
      expect(@product).to_not be_valid
    end

    it 'has name & price' do
      @product = Product.new(name: 'Staghorn Fern', price_cents: 300)
      @product.save
      expect(@product.name).to be_present
      expect(@product.price_cents).to be_present
      expect(@product).to_not be_valid
    end

    it 'has name, price & quantity' do
      @product = Product.new(name: 'Staghorn Fern', price_cents: 300, quantity: 25)
      @product.save
      expect(@product.name).to be_present
      expect(@product.price_cents).to be_present
      expect(@product.quantity).to be_present
      expect(@product).to_not be_valid
    end

    it 'has name, price, quantity & category' do
      @product = Product.new(name: 'Staghorn Fern', price_cents: 300, quantity: 25, category: @category)
      @product.save
      expect(@product.name).to be_present
      expect(@product.price_cents).to be_present
      expect(@product.quantity).to be_present
      expect(@product.category).to be_present
      expect(@product).to be_valid
    end

    it 'has name, price, quantity & category' do
      @product = Product.new(name: 'Staghorn Fern', price_cents: 300, quantity: 25, category: nil)
      @product.save
      expect(@product.name).to be_present
      expect(@product.price_cents).to be_present
      expect(@product.quantity).to be_present
      expect(@product.category).to_not be_present
      expect(@product).to_not be_valid
    end


    it 'should successfully create a product with all 4 entries' do
      @product = Product.new(name: 'Staghorn Fern', price_cents: 300, quantity: 25, category: @category)
      @product.save
      expect(@product).to be_present
      expect(@product).to be_valid
    end

    it 'should not work for missing name' do
      @product = Product.new(name: nil, price_cents: 300, quantity: 25, category: @category)
      @product.save
      expect(@product).to be_present
      expect(@product).to_not be_valid
    end

    it 'should not work for missing price' do
      @product = Product.new(name: 'Staghorn Fern', price_cents: nil, quantity: 25, category: @category)
      @product.save
      expect(@product).to be_present
      expect(@product).to_not be_valid
    end

    it 'should not work for missing quantity' do
      @product = Product.new(name: 'Staghorn Fern', price_cents: 300, quantity: nil, category: @category)
      @product.save
      expect(@product).to be_present
      expect(@product).to_not be_valid
    end

  end
end