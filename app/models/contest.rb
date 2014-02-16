class Contest < ActiveRecord::Base
  has_many :rounds
  has_many :images
  validates :api_key, presence: true
  include HTTParty

  def initialize_contest
    HTTParty.post("http://pv.pop.umn.edu/contest/" + self.api_key + "/reset")
    # if parsed_response["code"] == "200"
    #   return "Success!"
    # end
  end

  def status
    HTTParty.get("http://pv.pop.umn.edu/contest/" + self.api_key)
  end

  def save_project_details(status)
    parsed_status = JSON.parse(contest.status)
    self.name = parsed_status["contest"]["name"]
    self.active_round = parsed_status["contest"]["active_round"]
  end

  def get_call
    HTTParty.get("http://pv.pop.umn.edu/contest/" + self.api_key + "/images")
  end

  def create_from_hash(get_images)
    parsed_images = JSON.parse(contest.get_images)
    parsed_images.each do |hash|
      self.images.create(
      contest_id: self.id,
      flicker_id: hash["image"]["flickr_id"],
      owner: hash["image"]["owner"],
      title: hash["image"]["title"],
      url: hash["image"]["url"])
    end
  end

  def round_setup
    round = self.rounds.build(image_collection: [], round: 1)
    self.save
    self.images.all.each do |image|
      round.image_collection << image.id
    end
  end 

  def update_status(parsed_status)
    self.active_round = parsed_status["contest"]["active_round"]
    self.posted = parsed_status["contest"]["posted"]
  end

  def self.build_round(parsed_status)

  end

  def final_round?(parsed_status)
    ["contest"]["rounds"].first["pairs"].count == 1
  end

  def contest_id
    self.id
  end

end

