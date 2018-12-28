class PointsController < ApplicationController
  before_action :set_point, only: [:show, :edit, :update, :destroy]

  def index
    @points = Point.all
  end

  def show
  end

  def new
    @point = Point.new
  end

  def edit
  end

  def create

    @point = Point.create(point_params)
    @point.map.update(center: "#{@point.long},#{@point.lat}")

    render json: @point
  end

  def update
    respond_to do
      if @point.update(point_params)
        redirect_to @point, notice: 'Point was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @point.destroy
    respond_to do
      redirect_to points_url, notice: 'Point was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point
      @point = Point.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def point_params
      params.require(:point).permit(:map_id, :name, :long, :lat)
    end
end
