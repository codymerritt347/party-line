class MessagesController < ApplicationController
  before_action :set_party
  before_action :set_message, only: %i[ show edit update destroy ]

  def index
    @messages = @party.messages
  end

  def new
    @message = Message.new
  end

  def create
    @message = @party.messages.build(message_params)
    if @message.save
      redirect_to @party
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to @party
    else
      render :edit
    end
  end

  def destroy
    if @message
      @message.destroy
      redirect_to @party, success: "Message deleted"
    else
      redirect_to @party, error: "Message not found"
    end
  end

  private

  def set_party
    @party = Party.find(params[:party_id])
  end

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