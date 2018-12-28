class Search < ApplicationRecord
  include HTTParty
  base_uri 'api.mapbox.com'
  ACCESS_TOKEN = Rails.application.credentials.mapbox_access_token

  # https://api.mapbox.com/geocoding/v5/mapbox.places/Los%20Angeles.json?access_token=your-access-token

  def init(search:)
    @search = search
  end

  def places
    self.class.get("/geocoding/v5/mapbox.places/#{ERB::Util.u(search)}.json?access_token=#{ACCESS_TOKEN}&country=US&limit=1")
  end
end
