require 'rails_helper'

RSpec.describe "support_conversations/new", type: :view do
  before(:each) do
    assign(:support_conversation, SupportConversation.new(
      :author_id => 1,
      :receiver_id => 1
    ))
  end

  it "renders new support_conversation form" do
    render

    assert_select "form[action=?][method=?]", support_conversations_path, "post" do

      assert_select "input#support_conversation_author_id[name=?]", "support_conversation[author_id]"

      assert_select "input#support_conversation_receiver_id[name=?]", "support_conversation[receiver_id]"
    end
  end
end
