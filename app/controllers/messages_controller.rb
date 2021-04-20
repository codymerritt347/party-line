class MessagesController < ApplicationController
  before_action :set_message, only: %i [ show edit update destroy ]

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
      redirect_to @message
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @message.update(message_params)
    redirect_to @message
  end

  def destroy
    if @message
      @message.destroy
      redirect_to messages_path, notice: "Message deleted"
    else
      redirect_to messages_path, notice: "Message not found"
    end
  end

  private

  def set_message
    @message = Message.find_by_id(params[:id])
  end

  def message_params
    params.require(:message).permit(
      :party_id,
      :user_id,
      :content
    )
  end
end
