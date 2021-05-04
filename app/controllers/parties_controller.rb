class PartiesController < ApplicationController
  before_action :set_party, only: %i[ show edit update destroy ]
  
  def index
    @parties = helpers.current_user.parties
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    if @party.valid?
      helpers.current_user.parties << @party
      @party.save
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
      user_ids: []
    )
  end

end
