class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  def search
    @table = Product.arel_table
    @products = Product.where(@table[:productname].matches("%#{params[:stext]}%").or(@table[:productarticul].matches("%#{params[:stext]}%")))
    render :index
  end

  def parse
    file_path = "/home/krulov/price_merlion_msk.xls"
    file = Roo::Excel.new(file_path)
    file.row(15)[7]
    file.row(25)[8]
    redirect_to products_path
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
