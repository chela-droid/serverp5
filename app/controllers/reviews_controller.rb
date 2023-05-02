class ReviewsController < ApplicationController
    before_action :authenticate_request, only: [:create, :update]
    def index
        render json: Review.all
    end
    def show
        render json: Review.where(product_id: params[:id])
    end
    def create
        @review = Review.new(new_reviews)
        @review.user = @current_user
        @review.product = Product.find(params[:id])
        
        if @review.save
          render json: @review, status: :created
        else
          render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
        end
      end
      

    def update
        reviews = Review.find(params[:id])
        if reviews.update(new_reviews)
            render json: { message: "review succesfully updated" }, status: :ok
           else 
            render json: user.errors, status: :unprocessable_entity
           end
    end
      def product_reviews
    reviews = Review.where(product_id: params[:id])
    render json: reviews
  end
    def destroy
         reviews = Order.find_by(id: params[:id])
      if reviews.destroy
      render json: {mesage: "deleted successfully"},status: :ok
      end
    end
    private
    def set_product
        @product = Product.find(params[:product_id])
      end
      def new_reviews
        params.require(:review).permit(:star_rating, :comment, :id)
      end
      

end