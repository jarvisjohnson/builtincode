require 'rails_helper'

RSpec.describe "features/index", type: :view do
  before(:each) do
    assign(:features, [
      Feature.create!(
        :website => nil,
        :billing_units => 2,
        :quantity => 3,
        :name => "Name"
      ),
      Feature.create!(
        :website => nil,
        :billing_units => 2,
        :quantity => 3,
        :name => "Name"
      )
    ])
  end

  it "renders a list of features" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
