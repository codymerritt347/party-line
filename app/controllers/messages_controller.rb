class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new(message_params)
  end

  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to message_path(@message)
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
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(
      :content
    )
end
