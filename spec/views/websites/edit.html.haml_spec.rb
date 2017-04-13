require 'rails_helper'

RSpec.describe "websites/edit", type: :view do
  before(:each) do
    @website = assign(:website, Website.create!(
      :client => nil,
      :features => nil,
      :billing_units => 1,
      :name => "MyString",
      :app_type => "MyString",
      :ssl => false,
      :cdn => false
    ))
  end

  it "renders the edit website form" do
    render

    assert_select "form[action=?][method=?]", website_path(@website), "post" do

      assert_select "input#website_client_id[name=?]", "website[client_id]"

      assert_select "input#website_features_id[name=?]", "website[features_id]"

      assert_select "input#website_billing_units[name=?]", "website[billing_units]"

      assert_select "input#website_name[name=?]", "website[name]"

      assert_select "input#website_app_type[name=?]", "website[app_type]"

      assert_select "input#website_ssl[name=?]", "website[ssl]"

      assert_select "input#website_cdn[name=?]", "website[cdn]"
    end
  end
end
