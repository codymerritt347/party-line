class RepliesController < ApplicationController
  def index
    @replies = Reply.all
  end

  def new
    @reply = Reply.new
  end

  def create
    @reply = Reply.new(reply_params)
    if @reply.valid?
      @reply.user = User.find(params[:id])
      @reply.save
      redirect_to reply_path(@reply)
    else
      render :new
    end
  end

  def show
    @reply = Reply.find(params[:id])
  end

  def edit
    @reply = Reply.find(params[:id])
  end

  def update
    @reply = Reply.find(params[:id])
    @reply.update(reply_params)
    redirect_to reply_path(@reply)
  end

  def destroy
    reply = Reply.find(params[:id])
    if reply
      reply.destroy
      redirect_to replies_path, notice: "Reply deleted"
    else
      redirect_to replies_path, notice: "Reply not found"
  end

  private

  def reply_params
    params.require(:reply).permit(
      :message_id,
      :user_id,
      :content
    )
  end
end
