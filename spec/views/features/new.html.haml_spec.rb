require 'rails_helper'

RSpec.describe "features/new", type: :view do
  before(:each) do
    assign(:feature, Feature.new(
      :website => nil,
      :billing_units => 1,
      :quantity => 1,
      :name => "MyString"
    ))
  end

  it "renders new feature form" do
    render

    assert_select "form[action=?][method=?]", features_path, "post" do

      assert_select "input#feature_website_id[name=?]", "feature[website_id]"

      assert_select "input#feature_billing_units[name=?]", "feature[billing_units]"

      assert_select "input#feature_quantity[name=?]", "feature[quantity]"

      assert_select "input#feature_name[name=?]", "feature[name]"
    end
  end
end
