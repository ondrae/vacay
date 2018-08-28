class Point < ApplicationRecord
  belongs_to :map

  after_save do
    map.update(center: "[#{long}, #{lat}]")
  end
end
