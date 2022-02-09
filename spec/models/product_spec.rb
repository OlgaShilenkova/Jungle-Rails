require 'rails_helper'
require 'product'


RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should has a name, price, quantity and category' do
      category = Category.create(name: "Electronics")
      product = Product.create(name: "PocoPhone", price: 49, quantity: 5, category_id: category.id)
      expect(product.errors.full_messages).to be_empty
    end
    
    it 'should show error message if name is empty' do
      category = Category.create(name: "Electronics")
      product = Product.create( price: 49, quantity: 5, category_id: category.id)
      expect(product.errors.full_messages).to include("Name can't be blank")
    end
    
    it 'should show error message if price is empty' do
      category = Category.create(name: "Electronics")
      product = Product.create( name: "PocoPhone", quantity: 5, category_id: category.id)
      expect(product.errors.full_messages).to include("Price can't be blank")
    end
    
    it 'should show error message if quantity is empty' do
      category = Category.create(name: "Electronics")
      product = Product.create( name: "PocoPhone", price: 49, category_id: category.id)
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should show error message if category is empty' do
      category = Category.create(name: "Electronics")
      product = Product.create( name: "PocoPhone", price: 49, quantity: 5)
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

  end 
 
end
