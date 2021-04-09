class RepliesController < ApplicationController
  def index
    @replies = Reply.all
  end

  def new
    @reply = Reply.new(reply_params)
  end

  def create
    @reply = Reply.new(reply_params)
    @reply.save
    redirect_to reply_path(@reply)
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
    @reply = Reply.find(params[:id])
  end

  private

  def reply_params
    params.require(:reply).permit(
      :content
    )
  end
end
