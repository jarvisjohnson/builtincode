require 'rails_helper'

RSpec.describe "features/show", type: :view do
  before(:each) do
    @feature = assign(:feature, Feature.create!(
      :website => nil,
      :billing_units => 2,
      :quantity => 3,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Name/)
  end
end
