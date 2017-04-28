require 'rails_helper'

RSpec.describe "support_conversations/edit", type: :view do
  before(:each) do
    @support_conversation = assign(:support_conversation, SupportConversation.create!(
      :author_id => 1,
      :receiver_id => 1
    ))
  end

  it "renders the edit support_conversation form" do
    render

    assert_select "form[action=?][method=?]", support_conversation_path(@support_conversation), "post" do

      assert_select "input#support_conversation_author_id[name=?]", "support_conversation[author_id]"

      assert_select "input#support_conversation_receiver_id[name=?]", "support_conversation[receiver_id]"
    end
  end
end
