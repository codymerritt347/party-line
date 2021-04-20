class PartiesController < ApplicationController
  before_action :set_party, only: %i[ show edit update destroy ]
  helper_method :params
  
  def index
    @parties = Party.all
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    if @party.valid?
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
    @party = Party.find(params[:id])
  end
  
  def party_params
    params.require(:party).permit(
      :name,
      user_ids: []
    )
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
