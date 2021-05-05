class PartiesController < ApplicationController
  before_action :set_party, only: %i[ show edit update destroy ]
  
  def index
    @party = Party.all
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    @party.users << current_user
    if @party.save
      render :index
    else
      render :new
    end
  end

  def show
    @message = Message.new
  end

  def edit
  end

  def update
    @party.update(party_params)
    redirect_to @party
  end

  def destroy
    if @party
      @party.destroy
      redirect_to parties_path, notice: "Party deleted"
    else
      redirect_to parties_path, notice: "Party not found"
    end
  end

  private
  
  def set_party
    @party = Party.find_by_id(params[:id])
  end
  
  def party_params
    params.require(:party).permit(
      :name,
      user_ids: [],
      message_ids: []
    )
  end

end
