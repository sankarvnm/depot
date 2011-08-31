# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


#the images used in the seed data are pre cropped. The seed step does not pass through the cropping phase. 

Product.delete_all

@products =[
		{:title => 'burger', 
		:description => 'Burgers taste really good. you should order one now. very delicioso', 
		:image => File.open('public/images/burger.jpg'), 
		:price => 2.45},
		
		{:title => 'Pizza', 
		:description => 'Pizza taste really good. you should order one now. very delicioso', 
		:image => File.open('public/images/pizza.jpg'), 
		:price => 12.45},
		
		{:title => 'Soup', 
		:description => 'Soup taste really good. you should order one now. very delicioso', 
		:image => File.open('public/images/soup.jpg'), 
		:price => 15.45},
		
		{:title => 'Salad', 
		:description => 'Salad taste really good. you should order one now. very delicioso', 
		:image => File.open('public/images/salad.jpg'), 
		:price => 17.45}
	]

def create_products(title, description, price, image)
	Product.create(
		:image => image,
		:title => title,
		:description => description,
		:price => price
	)
end

@products.each do |product|
	create_products(product[:title], product[:description], product[:price], product[:image])
end
