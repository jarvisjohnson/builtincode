# == Schema Information
#
# Table name: support_conversations
#
#  id          :integer          not null, primary key
#  author_id   :integer
#  receiver_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  website_id  :integer
#
# Indexes
#
#  index_support_conversations_on_author_id    (author_id)
#  index_support_conversations_on_receiver_id  (receiver_id)
#  index_support_conversations_on_website_id   (website_id)
#

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe SupportConversationsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # SupportConversation. As you add validations to SupportConversation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SupportConversationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all support_conversations as @support_conversations" do
      support_conversation = SupportConversation.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:support_conversations)).to eq([support_conversation])
    end
  end

  describe "GET #show" do
    it "assigns the requested support_conversation as @support_conversation" do
      support_conversation = SupportConversation.create! valid_attributes
      get :show, params: {id: support_conversation.to_param}, session: valid_session
      expect(assigns(:support_conversation)).to eq(support_conversation)
    end
  end

  # describe "GET #new" do
  #   it "assigns a new support_conversation as @support_conversation" do
  #     get :new, params: {}, session: valid_session
  #     expect(assigns(:support_conversation)).to be_a_new(SupportConversation)
  #   end
  # end

  # describe "GET #edit" do
  #   it "assigns the requested support_conversation as @support_conversation" do
  #     support_conversation = SupportConversation.create! valid_attributes
  #     get :edit, params: {id: support_conversation.to_param}, session: valid_session
  #     expect(assigns(:support_conversation)).to eq(support_conversation)
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new SupportConversation" do
  #       expect {
  #         post :create, params: {support_conversation: valid_attributes}, session: valid_session
  #       }.to change(SupportConversation, :count).by(1)
  #     end

  #     it "assigns a newly created support_conversation as @support_conversation" do
  #       post :create, params: {support_conversation: valid_attributes}, session: valid_session
  #       expect(assigns(:support_conversation)).to be_a(SupportConversation)
  #       expect(assigns(:support_conversation)).to be_persisted
  #     end

  #     it "redirects to the created support_conversation" do
  #       post :create, params: {support_conversation: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(SupportConversation.last)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved support_conversation as @support_conversation" do
  #       post :create, params: {support_conversation: invalid_attributes}, session: valid_session
  #       expect(assigns(:support_conversation)).to be_a_new(SupportConversation)
  #     end

  #     it "re-renders the 'new' template" do
  #       post :create, params: {support_conversation: invalid_attributes}, session: valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested support_conversation" do
  #       support_conversation = SupportConversation.create! valid_attributes
  #       put :update, params: {id: support_conversation.to_param, support_conversation: new_attributes}, session: valid_session
  #       support_conversation.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "assigns the requested support_conversation as @support_conversation" do
  #       support_conversation = SupportConversation.create! valid_attributes
  #       put :update, params: {id: support_conversation.to_param, support_conversation: valid_attributes}, session: valid_session
  #       expect(assigns(:support_conversation)).to eq(support_conversation)
  #     end

  #     it "redirects to the support_conversation" do
  #       support_conversation = SupportConversation.create! valid_attributes
  #       put :update, params: {id: support_conversation.to_param, support_conversation: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(support_conversation)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns the support_conversation as @support_conversation" do
  #       support_conversation = SupportConversation.create! valid_attributes
  #       put :update, params: {id: support_conversation.to_param, support_conversation: invalid_attributes}, session: valid_session
  #       expect(assigns(:support_conversation)).to eq(support_conversation)
  #     end

  #     it "re-renders the 'edit' template" do
  #       support_conversation = SupportConversation.create! valid_attributes
  #       put :update, params: {id: support_conversation.to_param, support_conversation: invalid_attributes}, session: valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested support_conversation" do
  #     support_conversation = SupportConversation.create! valid_attributes
  #     expect {
  #       delete :destroy, params: {id: support_conversation.to_param}, session: valid_session
  #     }.to change(SupportConversation, :count).by(-1)
  #   end

  #   it "redirects to the support_conversations list" do
  #     support_conversation = SupportConversation.create! valid_attributes
  #     delete :destroy, params: {id: support_conversation.to_param}, session: valid_session
  #     expect(response).to redirect_to(support_conversations_url)
  #   end
  # end

end