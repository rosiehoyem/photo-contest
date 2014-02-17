class RoundsController < ApplicationController
  before_action :set_contest
  before_action :set_round, only: [:show, :edit, :update, :destroy]

  def index
    @rounds = Round.all
  end

  def show
    @contest.round_setup(@round)
    object_hash = []
    @round.image_collection.each do |id|
      object_hash << Image.find_by(flickr_id: id)
    end
    @pairs = object_hash.each_slice(2).to_a
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round
      @round = Round.find(params[:id])
    end

    def set_contest
      @contest = Contest.find(params[:contest_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def round_params
      params.require(:round).permit(:number)
    end
end
