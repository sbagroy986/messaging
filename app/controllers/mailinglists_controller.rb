class MailinglistsController < ApplicationController
  before_action :set_mailinglist, only: [:show, :edit, :update, :destroy]

  # GET /mailinglists
  # GET /mailinglists.json
  def index
    @mailinglists = Mailinglist.all
  end

  # GET /mailinglists/1
  # GET /mailinglists/1.json
  def show
  end

  # GET /mailinglists/new
  def new
    @mailinglist = Mailinglist.new
  end

  # GET /mailinglists/1/edit
  def edit
  end

  # POST /mailinglists
  # POST /mailinglists.json
  def create
    @mailinglist = Mailinglist.new(mailinglist_params)

    respond_to do |format|
      if @mailinglist.save
        format.html { redirect_to @mailinglist, notice: 'Mailinglist was successfully created.' }
        format.json { render :show, status: :created, location: @mailinglist }
      else
        format.html { render :new }
        format.json { render json: @mailinglist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mailinglists/1
  # PATCH/PUT /mailinglists/1.json
  def update
    respond_to do |format|
      if @mailinglist.update(mailinglist_params)
        format.html { redirect_to @mailinglist, notice: 'Mailinglist was successfully updated.' }
        format.json { render :show, status: :ok, location: @mailinglist }
      else
        format.html { render :edit }
        format.json { render json: @mailinglist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mailinglists/1
  # DELETE /mailinglists/1.json
  def destroy
    @mailinglist.destroy
    respond_to do |format|
      format.html { redirect_to mailinglists_url, notice: 'Mailinglist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mailinglist
      @mailinglist = Mailinglist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mailinglist_params
      params.require(:mailinglist).permit(:name, :list)
    end
end
