class Map < ApplicationRecord
  belongs_to :user
  has_many :points

  # validates :center, format: { with: /\[\d\.\d{3},\d\.\d{3}\]/, message: "longitude, latitude" }
end
