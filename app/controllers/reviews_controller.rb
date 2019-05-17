class ReviewsController < ApplicationController
    before_filter {authenticate}
    def index
        puts 'PARAMS!'
        puts params[:product_id] # req.params
        @product = Product.find(params[:product_id]) # dynamic to the URL
        @reviews = @product.reviews.all.order(created_at: :desc)
        
       
      end


    def create
        @product = Product.find(params[:product_id])
        @review = @product.reviews.create(allowed_params)
        @review.user = current_user
        @review.save
        redirect_to product_reviews_path(@product)
      end

    
      def destroy
        @product = Product.find(params[:product_id])
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to product_reviews_path(@product)
      end


      private
      def allowed_params
        params.require(:review).permit(:rating, :description)
      end  

      def authenticate
        current_user
      end
  
end
