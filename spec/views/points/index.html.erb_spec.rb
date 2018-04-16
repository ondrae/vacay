require 'rails_helper'

RSpec.describe "points/index", type: :view do
  before(:each) do
    assign(:points, [
      Point.create!(
        :map => nil,
        :content => "MyText"
      ),
      Point.create!(
        :map => nil,
        :content => "MyText"
      )
    ])
  end

  it "renders a list of points" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
