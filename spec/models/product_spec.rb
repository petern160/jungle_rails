require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'validates presence of product price' do
      # if price not entered not valid
      @product = Product.create(name: nil, price: 5, quantity: 10, category: Category.new)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
 


    it 'validates presence of product price' do
      # if price not entered not valid
      @product = Product.create(price: nil, name: 'input', quantity: 10, category: Category.new)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end


    
    it 'validates presence of product quantity' do
      # if price not entered not valid
      @product = Product.create(quantity: nil, name: 'input', price: 10, category: Category.new)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end



    it 'validates presence of product category' do
      # if price not entered not valid
      @product = Product.create(category: nil, name: 'input', price: 10, quantity: 10)
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

    it 'is not valid' do
      @product = Product.create
      expect(@product.errors.full_messages).to include("Price can't be blank", "Name can't be blank", "Category can't be blank","Quantity can't be blank", )
    end
   
end

end
