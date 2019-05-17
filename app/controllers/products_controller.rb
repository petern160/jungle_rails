class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
   
  end

  
  def show
    @product = Product.find params[:id]
    
    @newReview = Review.new()
    @reviews = @product.reviews

    if(!@reviews.empty?)
    @average_rating = "#{(@reviews.average :rating).round(2)}/5"
    else
      @average_rating = "no reviews done"
    end
  end

end
