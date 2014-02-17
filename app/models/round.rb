class Round < ActiveRecord::Base
  belongs_to :contest
  has_many :images
  include HTTParty

  def round_id
    self.number
  end

  def get_round
    HTTParty.get("http://pv.pop.umn.edu/contest/" + self.contest.api_key + "/round")
  end

  def save_winners
    winners = []
    self.image_collection.each do |id|
      image = Image.find_by(flickr_id: id)
      winners << id if image.in_competition = true
    end
    round.update_attributes(winner_collection: winners)
  end

  def prepare_round_data
    @data=[]
    self.winner_collection.each do |winner_id|
      @data << Image.find_by(flickr_id: winner_id)
    end
  end

  # example payload:
  #   [{"url":"http://farm8.staticflickr.com/7047/6926156003_3374ac17b8_z.jpg","flickr_id":"6926156003"},
  #     {"url":"http://farm8.staticflickr.com/7201/6780039472_5f2ccb6b2e_z.jpg","flickr_id":"6780039472"}]
 

  def post_round
    HTTParty.post("http://pv.pop.umn.edu/contest/" + self.contest.api_key + "/round/" + self.number + ", :body =>JSON.dump(" + @data.to_json + "), :options => {:headers {'Content-Type' => 'application/json', 'Accept' => 'application/json'}}")
  end

end
