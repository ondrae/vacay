class AddLongitudeAndLatitudeToPoints < ActiveRecord::Migration[5.2]
  def change
    add_column :points, :long, :string
    add_column :points, :lat, :string
  end
end
