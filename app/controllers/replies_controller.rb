class RepliesController < ApplicationController
  before_action :set_reply, only: %i[ show edit update destroy ]

  def index
    @replies = Reply.all
  end

  def new
    @reply = Reply.new
  end

  def create
    @reply = Reply.new(reply_params)
    if @reply.valid?
      @reply.save
      redirect_to @reply
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @reply.update(reply_params)
    redirect_to @reply
  end

  def destroy
    if @reply
      @reply.destroy
      redirect_to replies_path, notice: "Reply deleted"
    else
      redirect_to replies_path, notice: "Reply not found"
    end
  end

  private

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(
      :message_id,
      :user_id,
      :content
    )
  end
end