require 'rails_helper'

RSpec.describe "points/show", type: :view do
  before(:each) do
    @point = assign(:point, Point.create!(
      :map => nil,
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
