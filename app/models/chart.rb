class Chart < ApplicationRecord

  def index
    render json: Chart.all
  end
  def show
    render json: Chart.find_by(id: params[:id])
  end
   
end
