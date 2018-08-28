class AddYelpLinkToPoints < ActiveRecord::Migration[5.2]
  def change
    add_column :points, :yelp_link, :string
  end
end
