class ImagesController < ApplicationController
  before_action :set_image, only: [:wins, :show]

  def index
    @images = Image.all
  end

  def show
  end

  def winners
    @round = Round.find(params[:round_id])
    @contest = Contest.find(params[:contest_id])
    Image.update_all({in_competition: true}, {id: params[:image_ids]})
    redirect_to contest_url(@contest)
    respond_to do |format|
      if @image.update(image_params)
        flash[:notice] = "Your photo winners were successfully saved."     
        format.html { redirect_to winner_contest_round_images(round_id: @round.id) } 
        format.json { render action: 'image#winner', status: :created, location: winner_contest_round_images(round_id: @round.id) }
      else
        flash[:notice] = "I'm sorry. We couldn't save your photo winners."
        format.html { render action: 'round#show' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def winner
    @winner = Image.find_by(flickr_id: id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:flickr_id, :owner, :title, :url, :loser_id, :id, :in_competition, :image_id, contests_attributes: [:contest_id], rounds_attributes: [:round_id])
    end
end
