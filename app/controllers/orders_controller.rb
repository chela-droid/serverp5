class OrdersController < ApplicationController
   before_action :authenticate_request, only: [:create, :update]
   def index 
    orders=Order.all
    render json: orders
   end
 
   def show
      orders= Order.find_by(id: params[:id])
      render json: orders
   end
 
   def create
      @orders = Order.new(new_params)
      @orders.user = @current_user
      @orders.product = Product.find(params[:product_id])
      if @orders.save
         @orders.product.quantity -= 1
         render json: @orders, status: :created
      else
         render json: @orders.errors, status: :unprocessable_entity
      end
   
 
   def update
      orders = Order.find(params[:id])
      if orders.update(new_paramss)
         render json: { message: "product succesfully updated" }, status: :ok
        else 
         render json: orders.errors, status: :unprocessable_entity
        end
   end
 
   def destroy
      orders = Order.find_by(id: params[:id])
      if orders.destroy
      render json: {mesage: "deleted successfully"},status: :ok
      end
   end

def top_product
   top_products = Order.joins(:product).group(:title).sum(:quantity).sort_by { |k, v| -v }.to_h
   render json: top_products
end

def orders_by_date
   orders_by_date = Order.group("DATE_TRUNC('day', created_at)").count
   render json: orders_by_date
 end
 
 def average_order_value
   average_order_value = Order.average(:price)
   render json: average_order_value
 end
  
   def orders_per_category
      orders_by_category = Order.joins(product: :category).group('categories.id').count
      render json: orders_by_category
    end

    def show_invoice
      order = Order.find(params[:id])
      invoice = generate_invoice(order)
      render json: { invoice: invoice }
    end
   private
   def new_params
      params.permit(:product_id, :quantity, :price)
   end
   def generate_invoice(order)
      invoice = {
        order_number: order.id,
        order_date: order.created_at.to_date,
        customer_name: order.user.name,
        customer_email: order.user.email,
        product_name: order.product.title,
        product_price: order.price,
        quantity: order.quantity,
        subtotal: order.price * order.quantity,
        tax_rate: 0.10, # assuming 10% tax rate
        tax_amount: (order.price * order.quantity) * 0.10,
        total: (order.price * order.quantity) * 1.10 # total = subtotal + tax_amount
      }
      return invoice
    end
end
