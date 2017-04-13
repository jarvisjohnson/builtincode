require 'rails_helper'

RSpec.describe "websites/show", type: :view do
  before(:each) do
    @website = assign(:website, Website.create!(
      :client => nil,
      :features => nil,
      :billing_units => 2,
      :name => "Name",
      :app_type => "App Type",
      :ssl => false,
      :cdn => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/App Type/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
