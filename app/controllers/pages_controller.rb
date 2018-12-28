class PagesController < ApplicationController
  def index
    @maps = Map.all
    @search = Search.new
  end
end
