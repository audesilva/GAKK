class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @matching_user = User.find(params[:user2])
    #puts "matching user"
    #puts @matching_user.id

  end

  def create
    recipients = User.where(id: conversation_params[:recipients])
    #recipients = User.find(params[@matching_user.id])
    #recipients = User.where(id: conversation_params[:user2])

    puts "recipients: "
    puts recipients
    subject1 = 'Message From Potential Roommate'
    conversation = current_user.send_message(recipients, conversation_params[:body], subject1).conversation
    flash[:notice] = "Your message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  def show
    @receipts = conversation.receipts_for(current_user)
    # mark conversation as read
    conversation.mark_as_read(current_user)
  end

  def reply
    current_user.reply_to_conversation(conversation, message_params[:body])
    flash[:notice] = "Your reply message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to mailbox_inbox_path
  end


  private

  def conversation_params
    params.require(:conversation).permit(:subject, :body,recipients:[])
  end

  def message_params(*keys)
    fetch_params(:message, *keys)
  end

  def fetch_params(key, *subkeys)
    params[key].instance_eval do
      case subkeys.size
        when 0 then self
        when 1 then self[subkeys.first]
        else subkeys.map{|k| self[k] }
      end
    end
  end

end
