class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json

  def index
    #@producthash = Hash.new
    #@table = Product.arel_table
    @stext = params[:stext]
    #@orders = ['price']
    if @stext.nil? then
      evstring = 'Product.all.limit(300)'
    else
      stexthash = @stext.split(' ')
      stexthash.map! {|textpce| textpce = "%"+textpce+"%" }
      evstring = 'Product.where{(productname.like_all stexthash) | (productarticul.like_all stexthash)}'
    end
    @orders = params[:order]
    @orders=[] if @orders.nil?
    @orders.each {|ordtxt| evstring = evstring + ".order{" + ordtxt + "}"}
    @products = eval (evstring)
    #@products = Product.where{(productname.like_all stexthash) | (productarticul.like_any stexthash)}.order{price.asc}.order{productname.asc}
  end

  def setorder
    @orders = params[:order]
    @stext = params[:stext]
    @setorder = params[:setorder]
    @orders = [] if @orders.nil?
    if @orders.include?(@setorder)
      @orders.map!{|ord|ord==@setorder ? ord=@setorder+'.desc':ord=ord}
    elsif @orders.include?(@setorder+'.desc')
      @orders.delete(@setorder+'.desc')
    else
      @orders.push (@setorder)
    end
    redirect_to :controller => 'products', :action => 'index', :order => @orders, :stext => @stext
  end
  # GET /products/1
  # GET /products/1.json
  # def show
  # end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  # def edit
  # end

  # POST /products
  # POST /products.json
#  def create
#    @product = Product.new(product_params)
#
#    respond_to do |format|
#      if @product.save
#        format.html { redirect_to @product, notice: 'Product was successfully created.' }
#        format.json { render :show, status: :created, location: @product }
#      else
#        format.html { render :new }
#        format.json { render json: @product.errors, status: :unprocessable_entity }
#      end
#    end
#  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
#  def update
#    respond_to do |format|
#      if @product.update(product_params)
#        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
#        format.json { render :show, status: :ok, location: @product }
#      else
#        format.html { render :edit }
#        format.json { render json: @product.errors, status: :unprocessable_entity }
#      end
#    end
#  end

  # DELETE /products/1
  # DELETE /products/1.json
#  def destroy
#    @product.destroy
#    respond_to do |format|
#      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
#      format.json { head :no_content }
#    end
#  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:productarticul, :productname, :distributor, :price, :nalichie)
    end
end
