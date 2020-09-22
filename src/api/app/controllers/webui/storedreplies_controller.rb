class Webui::StoredrepliesController < Webui::WebuiController
  before_action :require_login

  def create
    passed_reply = params.require(:stored_reply)
    reply = StoredReply.new(reply: passed_reply['reply'])
    reply.user_id = User.session.id

    status = if reply.save
               flash.now[:success] = 'Reply created successfully.'
               :ok
             else
               flash.now[:error] = "Failed to create reply: #{reply.errors.full_messages.to_sentence}."
               :unprocessable_entity
             end
    render(partial: 'webui/storedreply/comment_list', locals: { replies: User.session.stored_replies.map {|storedreply| storedreply.reply} }, status: status)
  end

  def destroy
    reply = StoredReply.find(params[:id])
    authorize reply, :destroy?

    status = if reply.blank_or_destroy
               flash.now[:success] = 'reply deleted successfully.'
               :ok
             else
               flash.now[:error] = "Failed to delete Reply: #{reply.errors.full_messages.to_sentence}."
               :unprocessable_entity
             end
    render(partial: 'webui/storedreply/comment_list', locals: { replies: User.session.stored_replies }, status: status)
  end
end
