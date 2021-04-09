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
end
