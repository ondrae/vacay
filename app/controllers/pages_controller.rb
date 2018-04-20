class PagesController < ApplicationController
  def index
    @maps = Map.all
  end
end
