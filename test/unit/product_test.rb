require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "Product attributes must not be empty" do
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:title].any?
  	assert product.errors[:description].any?								
  	assert product.errors[:price].any?	

  end
  
  test "product price must be positive" do 
  	product = Product.new(
  		:title => 'my food title',
  		:description => 'yyy'
  		)
  	
  	product.price = 0
  	assert product.invalid?
  	assert_equal "must be greater than or equal to 0.01",
  	product.errors[:price].join('; ')
  	
  	product.price = -1
  	assert product.invalid?
  	assert_equal "must be greater than or equal to 0.01",
  	product.errors[:price].join('; ')
  	
  	product.price = 1
  	product.valid?
  	
  end
 
  test 'product is not valid without a unique title' do
  	product = Product.new(
  		:title => products(:menu_item).title,
  		:description => 'this is a description',
  		:price => 1)
  		
  		assert !product.save
  		assert_equal 'has already been taken', 
  		product.errors[:title].join('; ')
  end
  
  
  
end
