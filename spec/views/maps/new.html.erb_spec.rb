require 'rails_helper'

RSpec.describe "maps/new", type: :view do
  before(:each) do
    assign(:map, Map.new(
      :user => nil,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new map form" do
    render

    assert_select "form[action=?][method=?]", maps_path, "post" do

      assert_select "input[name=?]", "map[user_id]"

      assert_select "input[name=?]", "map[name]"

      assert_select "textarea[name=?]", "map[description]"
    end
  end
end
