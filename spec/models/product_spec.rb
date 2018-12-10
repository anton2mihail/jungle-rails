require_relative '../rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new(name: 'exampletest')
    end

    it 'is valid with valid attributes' do
      @product = Product.new(name: 'test', price: 50, quantity: 2, category: @category)
      expect(@product).to be_valid
    end

    it 'is not valid without a name' do
      @product = Product.new(name: nil, price: 50, quantity: 2, category: @category)
      expect { @product.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without a price' do
      @product = Product.new(name: 'test', price: '', quantity: 2, category: @category)
      expect { @product.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without a quantity' do
      @product = Product.new(name: 'test', price: 50, quantity: nil, category: @category)
      expect { @product.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without a category' do
      @product = Product.new(name: 'test', price: 50, quantity: 2, category: nil)
      expect { @product.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end