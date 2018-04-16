require 'rails_helper'

RSpec.describe "maps/index", type: :view do
  before(:each) do
    assign(:maps, [
      Map.create!(
        :user => nil,
        :name => "Name",
        :description => "MyText"
      ),
      Map.create!(
        :user => nil,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of maps" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
