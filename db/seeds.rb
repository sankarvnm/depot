# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


#populates the products table ##############
# I want to shorten this to make it DRY. Make and array of each attribute and do an each loop. 
Product.delete_all

Product.create(
	:title =>'Burger', 
	:description => %{<p> this is a description. this is a description. this is a description. this is a description. </p>} ,
	:image_url => '/images/burger.jpg',
	:price => 49.50)

Product.create(
	:title =>'Pizza', 
	:description => %{<p> this is a description. this is a description. this is a description. this is a description. </p>} ,
	:image_url => '/images/pizza.jpg',
	:price => 20.50)
	
Product.create(
	:title =>'Salad', 
	:description => %{<p> this is a description. this is a description. this is a description. this is a description. </p>} ,
	:image_url => '/images/salad.jpg',
	:price => 19.50)
