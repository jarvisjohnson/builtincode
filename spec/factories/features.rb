# == Schema Information
#
# Table name: features
#
#  id            :integer          not null, primary key
#  website_id    :integer
#  billing_units :integer          default(2)
#  quantity      :integer          default(1)
#  name          :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_features_on_website_id  (website_id)
#

FactoryGirl.define do
  factory :feature do
    website nil
    billing_units 1
    quantity 1
    name "MyString"
  end
end
