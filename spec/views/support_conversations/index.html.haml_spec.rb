require 'rails_helper'

RSpec.describe "support_conversations/index", type: :view do
  before(:each) do
    assign(:support_conversations, [
      SupportConversation.create!(
        :author_id => 2,
        :receiver_id => 3
      ),
      SupportConversation.create!(
        :author_id => 2,
        :receiver_id => 3
      )
    ])
  end

  it "renders a list of support_conversations" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
