require 'rails_helper'

RSpec.describe "points/edit", type: :view do
  before(:each) do
    @point = assign(:point, Point.create!(
      :map => nil,
      :content => "MyText"
    ))
  end

  it "renders the edit point form" do
    render

    assert_select "form[action=?][method=?]", point_path(@point), "post" do

      assert_select "input[name=?]", "point[map_id]"

      assert_select "textarea[name=?]", "point[content]"
    end
  end
end
