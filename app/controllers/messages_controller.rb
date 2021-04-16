class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      @message.save
      redirect_to message_path(@message)
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    @message.update(message_params)
    redirect_to message_path(@message)
  end

  def destroy
    message = Message.find(params[:id])
    if message
      message.destroy
      redirect_to messages_path, notice: "Message deleted"
    else
      redirect_to messages_path, notice: "Message not found"
    end
  end

  # Party Name

  def party_name=(name)
    self.party = Party.find_by(name: name)
  end

  def party_name
    self.party ? self.party.name : nil
  end

  private

  def message_params
    params.require(:message).permit(
      :party_name,
      :user_id,
      :content
    )
  end
end
