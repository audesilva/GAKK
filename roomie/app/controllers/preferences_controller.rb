class PreferencesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_preferences, only: [:show, :edit, :update, :destroy]

  # GET /preferences
  # GET /preferences.json
  def index
    @user = User.find(params[:user_id])
    @preferences = @user.preferences;
  end

  # GET /preferences/1
  # GET /preferences/1.json
  def show
    @user = current_user
    @preferences = @user.preferences
  end

  # GET /preferences/new
  def new
    @user = User.find(params[:user_id])
    @preferences = @user.build_preferences()
  end

  # GET /preferences/1/edit
  def edit
    @user = User.find(params[:user_id]);
    @preferences = @user.preferences
  end

  # POST /preferences
  # POST /preferences.json
  def create
    @user = User.find(params[:user_id]);
    @preferences = @user.build_preferences(preferences_params)
    #@preferences = Preferences.new(preferences_params)
    #@preferences.id = current_user.id
    #@preferences.user_id = current_user.id
    @preferences.save

    respond_to do |format|
      if @preferences.save
        format.html { redirect_to edit_user_preferences_path(@user,@preference), notice: 'Preferences were successfully created.' }
        format.json { render :show, status: :created, location: user_preferences_path(@preferences,@user) }
      else
        format.html { render :new }
        format.json { render json: @preferences.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preferences/1
  # PATCH/PUT /preferences/1.json
  def update
    puts "in update\n"
    @user = User.find(params[:user_id]);
    @preferences = @user.preferences;

    respond_to do |format|
      if @preferences.update(preferences_params)
        format.html { redirect_to :back, notice: 'Preferences were successfully updated.' }
        format.json { render :show, status: :ok, location: @preferences }
      else
        format.html { render :edit }
        format.json { render json: @preferences.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preferences/1
  # DELETE /preferences/1.json
=begin
  def destroy
    @user = User.find(params[:user_id]);
    @preferences = Preferences.find(params[:id]);

    @preferences.destroy
    respond_to do |format|
      format.html { redirect_to user_preferences_url, notice: 'Preferences were successfully removed.' }
      format.json { head :no_content }
    end
  end
=end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preferences
      @user = User.find(params[:user_id]);
      @preferences = @user.preferences
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preferences_params
      params.require(:preferences).permit(:gender, :smoker, :pet_friendly, :cleanliness_level, :outgoingness_level, :quietness_level, :looking_for_residence, :street, :city, :state, :postal_code)
    end
end
