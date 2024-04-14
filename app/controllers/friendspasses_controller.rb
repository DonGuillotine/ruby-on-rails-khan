class FriendspassesController < ApplicationController
  before_action :set_friendspass, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only:[:edit, :update, :destroy]

  # GET /friendspasses or /friendspasses.json
  def index
    @friendspasses = Friendspass.all
  end

  # GET /friendspasses/1 or /friendspasses/1.json
  def show
  end

  # GET /friendspasses/new
  def new
    # @friendspass = Friendspass.new
    @friendspass = current_user.friendspass.build
  end

  # GET /friendspasses/1/edit
  def edit
  end

  # POST /friendspasses or /friendspasses.json
  def create
    # @friendspass = Friendspass.new(friendspass_params)
    @friendspass = current_user.friendspass.build(friendspass_params)

    respond_to do |format|
      if @friendspass.save
        format.html { redirect_to friendspass_url(@friendspass), notice: "Friendspass was successfully created." }
        format.json { render :show, status: :created, location: @friendspass }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friendspass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friendspasses/1 or /friendspasses/1.json
  def update
    respond_to do |format|
      if @friendspass.update(friendspass_params)
        format.html { redirect_to friendspass_url(@friendspass), notice: "Friendspass was successfully updated." }
        format.json { render :show, status: :ok, location: @friendspass }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friendspass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendspasses/1 or /friendspasses/1.json
  def destroy
    @friendspass.destroy

    respond_to do |format|
      format.html { redirect_to friendspasses_url, notice: "Friendspass was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @friendspass = current_user.friendspass.find_by(id: params[:id])
    redirect_to friendspasses_path, notice: "Unauthorized Action detected" if @friendspass.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendspass
      @friendspass = Friendspass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friendspass_params
      params.require(:friendspass).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end
