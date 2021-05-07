class FriendshipController < ApplicationController
  before_action :set_friendship, only: %i[ edit show update destroy ]

  def index
    @friendships = Friendship.all
  end

  def new
    friendship = Friendship.new
  end

  def create
    @friendship = Friendship.new(friendship_params)
    @friendship.user = current_user
    if @friendship.save
      render :index
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @friendship.update(friendship_params)
      render :index
    else
      render :edit
    end
  end

  def destroy
    if @friendship.destroy
      render :index
    else
      render :index
    end
  end

  private

  def friendship_params
    params.require(:friendship),permit(
      :user_id,
      :friend_id,
      :tag
    )
  end

  def set_friendship
    @friend = Friendship.find_by_id(params[:id])
  end
end
