require 'rails_helper'

RSpec.describe "maps/edit", type: :view do
  before(:each) do
    @map = assign(:map, Map.create!(
      :user => nil,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit map form" do
    render

    assert_select "form[action=?][method=?]", map_path(@map), "post" do

      assert_select "input[name=?]", "map[user_id]"

      assert_select "input[name=?]", "map[name]"

      assert_select "textarea[name=?]", "map[description]"
    end
  end
end
