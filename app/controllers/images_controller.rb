class ImagesController < ApplicationController
  before_action :set_image, only: [:wins, :show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  def wins
    @round = Round.find(params[:round_id])
    @winner = Image.find(params[:id])
    @loser = Image.find(params[:loser_id])
    @loser.in_competition = false
    respond_to do |format|
      if @image.update(image_params)
        flash[:notice] = "Thanks for stopping by!"     
        format.html { redirect_to winner_contest_round_images(round_id: @round.id) } 
        format.js
        format.json { render action: 'image#winner', status: :created, location: winner_contest_round_images(round_id: @round.id) }
      else
        flash[:notice] = "I'm sorry. We couldn't save your photo winner."
        format.html { render action: 'round#show' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def winner
    @winner = Image.find_by(flickr_id: id)
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render action: 'show', status: :created, location: @image }
      else
        format.html { render action: 'new' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:flickr_id, :owner, :title, :url, :loser_id, :contest_id, :round_id, :id, :in_competition, :win)
    end
end
