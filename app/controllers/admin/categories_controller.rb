class Admin::CategoriesController < ApplicationController
    def index
        @categories = Category.order(id: :desc).all
        # @products = Product.order(id: :desc).all
      end
    
      def new
        @category = Category.new
        # @product = Product.new
        end
    
      def create
        @category = Category.new(category_params)
    #     @product = Product.new(product_params)
        if @category.save
            redirect_to [:admin, :categories], notice: 'Category created!'
        else
            render :new
            end
        end

    #     if @product.save
    #       redirect_to [:admin, :products], notice: 'Product created!'
    #     else
    
    #       render :new
    #     end
    private

    def category_params
      params.require(:category).permit(
        :name,
      )
    end
  end
  