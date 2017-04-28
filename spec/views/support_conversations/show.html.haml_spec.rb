require 'rails_helper'

RSpec.describe "support_conversations/show", type: :view do
  before(:each) do
    @support_conversation = assign(:support_conversation, SupportConversation.create!(
      :author_id => 2,
      :receiver_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
