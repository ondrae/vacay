class SearchesController < ApplicationController
  def create
    search = Search.create(search: params[:search])
    @places = JSON.parse(search.places)

    render json: @places
  end
end
