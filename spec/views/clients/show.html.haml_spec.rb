require 'rails_helper'

RSpec.describe "clients/show", type: :view do
  before(:each) do
    @client = assign(:client, Client.create!(email: 'test@tester.me'))
    login_as(@client, :scope => :client)
  end

  it "renders attributes in <p>" do
    render
  end
end
