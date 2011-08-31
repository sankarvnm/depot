class ProductsController < ApplicationController
  # GET /products
  # GET /products.xml
  def index
    @products = Product.all
    @product = Product.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

############################################################################### index



  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end
  
  
  
############################################################################### show
  

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end


############################################################################### new



  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end


############################################################################### edit




  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
    if @product.save
    	if params[:product][:image].blank?
    	  format.html { redirect_to(@product, :notice => 'Product was successfully created.') }
	   	  format.xml  { render :xml => @product, :status => :created, :location => @product }
    	else  
    	  
	   	  format.html { render :action => "crop" }
		end
	else
	  format.html { render :action => "new" }
	  format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
	end
    end#ends respond_to do |format|
  end


############################################################################### create




  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
     if @product.update_attributes(params[:product])
	    
	    if params[:product][:image].blank?
    	  format.html { redirect_to(@product, :notice => 'Product was successfully created.') }
	   	  format.xml  { head :ok}
    	else    
	   	  format.html { render :action => "crop" }
		end	
	else
	  format.html { render :action => "edit" }
	  format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
    end
    end#ends respond_to do |format|
  end


############################################################################### update




  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
  
###############################################################################  
  
  def update_crop
    @product = Product.find(params[:id])
    @product.crop(params[:crop_x].to_i, params[:crop_y].to_i, params[:crop_h].to_i, params[:crop_w].to_i)

    redirect_to( @product , :notice => 'Your profile and avatar was successfully updated.')
  end
  
end
