class SupportConversationsController < ApplicationController
  before_action :set_support_conversation, only: [:show, :edit, :update, :destroy]

  # GET /support_conversations
  # GET /support_conversations.json
  def index
    @support_conversations = SupportConversation.all
  end

  # GET /support_conversations/1
  # GET /support_conversations/1.json
  def show
  end

  # GET /support_conversations/new
  def new
    @support_conversation = SupportConversation.new
  end

  # GET /support_conversations/1/edit
  def edit
  end

  # POST /support_conversations
  # POST /support_conversations.json
  def create
    @support_conversation = SupportConversation.new(support_conversation_params)

    respond_to do |format|
      if @support_conversation.save
        format.html { redirect_to @support_conversation, notice: 'Support conversation was successfully created.' }
        format.json { render :show, status: :created, location: @support_conversation }
      else
        format.html { render :new }
        format.json { render json: @support_conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /support_conversations/1
  # PATCH/PUT /support_conversations/1.json
  def update
    respond_to do |format|
      if @support_conversation.update(support_conversation_params)
        format.html { redirect_to @support_conversation, notice: 'Support conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @support_conversation }
      else
        format.html { render :edit }
        format.json { render json: @support_conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /support_conversations/1
  # DELETE /support_conversations/1.json
  def destroy
    @support_conversation.destroy
    respond_to do |format|
      format.html { redirect_to support_conversations_url, notice: 'Support conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_support_conversation
      @support_conversation = SupportConversation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def support_conversation_params
      params.require(:support_conversation).permit(:author_id, :receiver_id)
    end
end
