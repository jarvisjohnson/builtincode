FactoryGirl.define do
  factory :subscription do
    stripe_account_id "MyString"
    plan_id 1
    last_four "MyString"
    coupon_id 1
    card_type "MyString"
    current_price 1.5
    client_id 1
  end
end
