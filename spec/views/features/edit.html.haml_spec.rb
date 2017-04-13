require 'rails_helper'

RSpec.describe "features/edit", type: :view do
  before(:each) do
    @feature = assign(:feature, Feature.create!(
      :website => nil,
      :billing_units => 1,
      :quantity => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit feature form" do
    render

    assert_select "form[action=?][method=?]", feature_path(@feature), "post" do

      assert_select "input#feature_website_id[name=?]", "feature[website_id]"

      assert_select "input#feature_billing_units[name=?]", "feature[billing_units]"

      assert_select "input#feature_quantity[name=?]", "feature[quantity]"

      assert_select "input#feature_name[name=?]", "feature[name]"
    end
  end
end
