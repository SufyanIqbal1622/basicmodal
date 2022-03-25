class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
     @pagy, @products = pagy(Product.all)
     respond_to do |format|
       format.html
       format.json{
         render json: {entries: render_to_string(partial: 'posts', format:[:html]), pagination: view_context.pagy_nav(@pagy)}
        }
     end
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      render :create, status: :created
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    if @product.update(product_params)
      render :create, status: :created
    else
        render :form_update, status: :unprocessable_entity
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove(@product)
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :description)
    end
end
