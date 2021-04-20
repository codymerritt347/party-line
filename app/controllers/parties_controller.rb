class PartiesController < ApplicationController
  helper_method :params
  # before_action :require_login
  
  def index
    @parties = Party.all
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    if @party.valid?
      @party.users << User.find_by(first_name: "Cody")
      @party.save
      redirect_to party_path(@party)
    else
      render :new
    end
  end

  def show
    @party = Party.find(params[:id])
  end

  def edit
    @party = Party.find(params[:id])
  end

  def update
    @party = Party.find(params[:id])
    @party.update(party_params)
    redirect_to party_path(@party)
  end

  def destroy
    party = Party.find(params[:id])
    if party
      party.destroy
      redirect_to parties_path, notice: "Party deleted"
    else
      redirect_to parties_path, notice: "Party not found"
    end
  end

  private
  
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
