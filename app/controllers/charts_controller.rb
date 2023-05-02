class ChartsController < ApplicationController

    def index 
        render json: Chart.all, status: :ok
    end
    def show
     render json: Chart.find_by(id: params[:id])
    end
    def create 
      charts = Category.create(charts_params)
      if charts.save
          render json: charts, status: :created
       else
          render json: charts.errors, status: :unprocessable_entity
       end
  end

   def update
    charts = Charts.find(params[:id])
        if charts.update(charts_params)
            render json: { message: "product succesfully updated" }, status: :ok
           else 
            render json: charts.errors, status: :unprocessable_entity
           end
  end

  
    # def show_graph
    #   @charts = Chart.where(id: params[:id])
    #   g = Gruff::Line.new
    #   g.title = "Sales and Customers by Category"
    #   @charts.each do |c|
    #     g.data(c.name, [c.sales, c.customers])
    #   end
    #   g.write("public/chart.png")
    # end
    
    private
    def charts_params
      params.permit(:name, :sales, :customers)
    end

  end
  
