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
    current_user.parties << @party
    if @party.save
      render :index
    else
      render :new
    end
  end

  def show
    @party.build_message(user: current_user)
  end

  def edit
  end

  def update
    if @party.update(party_params)
      redirect_to @party
    else
      render :edit
    end
  end

  def destroy
    if @party.destroy
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
