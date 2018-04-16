require 'rails_helper'

RSpec.describe "maps/show", type: :view do
  before(:each) do
    @map = assign(:map, Map.create!(
      :user => nil,
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
