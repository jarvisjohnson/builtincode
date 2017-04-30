require 'rails_helper'

RSpec.describe "clients/index", type: :view do
  before(:each) do
    assign(:clients, [
      Client.create!(email: "me@me.com"),
      Client.create!(email: "me@testerz.com")
    ])
  end

  it "renders a list of clients" do
    render
  end
end
