class SupportConversationsController < ApplicationController
  before_action :set_support_conversation, except: [:index, :new, :create]
  before_action :check_participating!, except: [:index, :new, :create]
  before_action :set_admin_receiver

  # GET /support_conversations
  # GET /support_conversations.json
  def index
    @support_conversations = SupportConversation.participating(current_client).order('updated_at DESC')
  end

  # GET /support_conversations/1
  # GET /support_conversations/1.json
  def show
    @message = Message.new
  end

  # GET /support_conversations/new
  def new
    @receiver = Client.find(params[:receiver_id])
    @websites = current_client.websites
    @support_conversation = SupportConversation.new
    @message = @support_conversation.messages.build
  end

  # POST /support_conversations
  # POST /support_conversations.json
  def create
    @support_conversation = SupportConversation.new(support_conversation_params)

    respond_to do |format|
      if @support_conversation.save
        format.html { 
          redirect_to @support_conversation, notice: 'Support conversation was successfully created.'
          ClientMailer.new_message_received(@support_conversation.messages.last, @support_conversation).deliver_later
        }
        format.json { render :show, status: :created, location: @support_conversation }
      else
        format.html { render :new }
        format.json { render json: @support_conversation.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_support_conversation
      @support_conversation = SupportConversation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def support_conversation_params
      params.require(:support_conversation).permit(:author_id, :receiver_id, :website_id, :messages_attributes => [:body, :attached_image, :client_id])
    end

    def check_participating!
      redirect_to dashboard_index_path unless @support_conversation && @support_conversation.participates?(current_client)
    end 

    def set_admin_receiver
      @support_receiver = Client.find_by(admin: true)
      # @support_conversation = current_client.authored_support_conversations.build
    end    

end
