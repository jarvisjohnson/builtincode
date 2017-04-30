require 'rails_helper'

RSpec.describe "clients/show", type: :view do
  before(:each) do
    signed_in_as_a_valid_client
  end

  it "renders attributes in <p>" do
    render
  end
end
