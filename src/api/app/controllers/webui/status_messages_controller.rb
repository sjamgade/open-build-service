class Webui::StatusMessagesController < Webui::WebuiController
  # permissions.status_message_create
  before_action :require_admin, only: [:destroy, :create]

  def create
    # TODO: make use of permissions.status_message_create
    status_message = StatusMessage.new(message: params[:message], severity: params[:severity], user: User.session!)

    if status_message.save
      flash[:success] = 'Status message was successfully created.'
    else
      flash[:error] = "Could not create status message: #{status_message.errors.full_messages.to_sentence}"
    end

    redirect_to(controller: 'main', action: 'index')
  end

  def destroy
    status_message = StatusMessage.find(params[:id])

    if status_message.delete
      flash[:success] = 'Status message was successfully deleted.'
    else
      flash[:error] = "Could not delete status message: #{status_message.errors.full_messages.to_sentence}"
    end

    redirect_to(controller: 'main', action: 'index')
  end
end
