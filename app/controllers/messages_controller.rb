class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]
  before_action :set_party, only: %i[ index new create ]

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.party = @party
    @message.sender = current_user
    if @message.save
      redirect_to party_path(@party)
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
    if @message.destroy
      redirect_to @party, success: "Message deleted"
    else
      redirect_to @party, error: "Message not found"
    end
  end

  private

  def set_message
    @message = Message.find_by_id(params[:id])
  end

  def message_params
    params.require(:message).permit(
      :party_id,
      :content,
      :urgent,
      :sender
    )
  end

  def set_party
    @party = Party.find(params[:party_id])
  end

end