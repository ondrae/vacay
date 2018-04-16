require 'rails_helper'

RSpec.describe "points/new", type: :view do
  before(:each) do
    assign(:point, Point.new(
      :map => nil,
      :content => "MyText"
    ))
  end

  it "renders new point form" do
    render

    assert_select "form[action=?][method=?]", points_path, "post" do

      assert_select "input[name=?]", "point[map_id]"

      assert_select "textarea[name=?]", "point[content]"
    end
  end
end
