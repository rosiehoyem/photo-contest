class ContestsController < ApplicationController
  before_action :set_contest, only: [:show, :final, :finalize]

  # GET /contests
  # GET /contests.json
  def index
    @contests = Contest.all
  end

  def show
  end

  # GET /contests/new
  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.new(contest_params)

    respond_to do |format|
      if @contest.save
        @contest.initialize_contest
        if @status =!
        @contest.save_project_details(@contest.status)
        if @contest.name
          @round = @contest.rounds.create(number: 1, image_collection: [])
          @contest.active_round = @round.number
          if @contest.save
            if @contest.images_from_hash(@contest.get_images)        
              format.html { redirect_to contest_round_path(contest_id: @contest.id, id: @round.number), notice: 'Contest was successfully created.' }
              format.json { render action: 'show', status: :created, location: @contest }
            else
              format.html { render action: 'new', notice: "Sorry, we could not retrieve your images."}
              format.json { render action: 'show', status: :created, location: @contest } 
            end
          else
            format.html { render action: 'new', notice: 'Sorry, your new contest was not saved.'}
            format.json { render action: 'show', status: :created, location: @contest }
          end
        else
          format.html { render action: 'new', notice: 'Your contest was not initiated successfully'}
          format.json { render action: 'show', status: :created, location: @contest }
        end  
      else
        format.html { render action: 'new' }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  def final
    @image = Image.find_by(flickr_id: winner_id)
  end

  def finalize
    @contest.finalize_contest
    redirect_to root_path, notice: 'Your tournament was successfully finalized. Thanks for playing.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contest
      @contest = Contest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contest_params
      params.require(:contest).permit(:name, :active_round, :posted, :api_key)
    end
end
