class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    if current_user.preferences != nil && current_user.profile != nil
      Match.create_matches(current_user)
      @matches = Match.where(user_id_1: current_user.id).order(percent_match: :desc).limit(25)
      @match_count = Match.where(user_id_1: current_user.id).count()
    else
      flash[:alert] = "Please fill out profile and preferences first."
      redirect_to home_index_path
    end
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    @user2 = User.find(@match.user_id_2)
  end

  # GET /matches/new
  def new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
    end
end
