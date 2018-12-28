require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  describe "#search" do
    it do
      post :search, params: { search: "WHATUP" }
      puts response
    end
  end
end
