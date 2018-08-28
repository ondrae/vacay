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
    uri = URI(point_params[:yelp_link])
    name = uri.path.split("/").last
    response = HTTParty.get("https://api.yelp.com/v3/businesses/#{name}", { headers: { "Authorization" => "Bearer D0nhwyqAx8G3oLiZUqQ7jKJooPHLZYRi1TqbYs8bdv4XxpzyyZ7VfoIub-WAWuZ2f0marcVg_oJraUWLyk9FmelR9vLLjKkJOMDY4ijM71mBHjjPXWPe4HXWm79nW3Yx" }})
    long = response["coordinates"]["longitude"]
    lat = response["coordinates"]["latitude"]
    @point = Point.new(long: long, lat: lat, map_id: point_params[:map_id], name: name, yelp_link: point_params[:yelp_link])

    respond_to do |format|
      if @point.save
        format.json { head :ok }
      else
        format.json { head :bad_request }
      end
    end
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
      params.require(:point).permit(:map_id, :yelp_link)
    end
end
