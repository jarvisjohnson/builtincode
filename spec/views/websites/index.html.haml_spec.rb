require 'rails_helper'

RSpec.describe "websites/index", type: :view do
  before(:each) do
    assign(:websites, [
      Website.create!(
        :client => nil,
        :features => nil,
        :billing_units => 2,
        :name => "Name",
        :app_type => "App Type",
        :ssl => false,
        :cdn => false
      ),
      Website.create!(
        :client => nil,
        :features => nil,
        :billing_units => 2,
        :name => "Name",
        :app_type => "App Type",
        :ssl => false,
        :cdn => false
      )
    ])
  end

  it "renders a list of websites" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "App Type".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
