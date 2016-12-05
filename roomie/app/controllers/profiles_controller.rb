class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_filter :load_user
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  # GET /profiles
  # GET /profiles.json
  def index
    @user = User.find(params[:user_id])
    @profile = @user.profile;
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @user = current_user
    @profile = @user.profile
  end

  # GET /profiles/new
  def new
    @user = User.find(params[:user_id])
    @profile = @user.build_profile()
  end

  # GET /profiles/1/edit
  def edit
    @user = User.find(params[:user_id]);
    @profile = @user.profile
    @pictures = @profile.pictures

  end

  # POST /profiles
  # POST /profiles.json
  def create
    @user = User.find(params[:user_id]);
    @profile = @user.build_profile(profile_params)
    #@profile = Profile.new(profile_params)
    #@profile.id = current_user.id
    #@profile.user_id = current_user.id
    @profile.save

    respond_to do |format|
      if @profile.save
        if params[:avatars]
          #===== The magic is here ;)
          params[:avatars].each { |image|
            @profile.pictures.create(avatar: image)
          }
        end

        format.html { redirect_to edit_user_profile_path(@user,@profile), notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: user_profile_path(@profile,@user) }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    puts "in update\n"
    @user = User.find(params[:user_id]);
    @profile = @user.profile;
    @pictures = @profile.pictures

    respond_to do |format|
      if @profile.update(profile_params)
        if params[:avatars]
          #===== The magic is here ;)
          params[:avatars].each { |image|
            @profile.pictures.create(avatar: image)
          }
        end
        format.html { redirect_to :back , notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @user = User.find(params[:user_id]);
    @profile = Profile.find(params[:id]);

    @profile.destroy
    respond_to do |format|
      format.html { redirect_to user_profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def load_user
         @user = current_user
    end

    def set_profile
      @user = current_user
      @profile = @user.profile
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_name, :gender, :is_a_smoker, :pet_friendly, :cleanliness_level, :outgoingness_level, :quietness_level, :has_residence_already, :street, :city, :state, :postal_code,
                                      :pictures )
    end
end
