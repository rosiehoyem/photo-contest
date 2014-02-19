class Contest < ActiveRecord::Base
  has_many :rounds
  has_many :images
  validates :api_key, presence: true, uniqueness: true
  require 'rest_client'

  def initialize_contest
    RestClient.post("http://pv.pop.umn.edu/contest/" + self.api_key + "/reset")
  end

  def status
    RestClient.get("http://pv.pop.umn.edu/contest/" + self.api_key)
  end

  def save_project_details(status)
    parsed_status = JSON.parse(status)
    self.name = parsed_status["contest"]["name"]
    self.active_round = parsed_status["contest"]["active_round"]
  end

  def get_images
    RestClient.get("http://pv.pop.umn.edu/contest/" + self.api_key + "/images")
  end

  def images_from_hash(get_images)
    parsed_images = JSON.parse(get_images)
    parsed_images.each do |hash|
      self.images.create(
      contest_id: self.id,
      flickr_id: hash["image"]["flickr_id"],
      owner: hash["image"]["owner"],
      title: hash["image"]["title"],
      url: hash["image"]["url"])
    end
  end

  def round_setup(round)
    flickr_ids = []
    self.images.each do |image|
      flickr_ids << image.flickr_id
    end
    round.update_attributes(image_collection: flickr_ids)
  end 

  def update_status(parsed_status)
    self.active_round = parsed_status["contest"]["active_round"]
    self.posted = parsed_status["contest"]["posted"]
  end

  def final_round?(parsed_status)
    ["contest"]["rounds"].first["pairs"].count == 1
  end

  def finalize_contest
    RestClient.post("http://pv.pop.umn.edu/contest/" + self.api_key + "/done")
  end

  def contest_id
    self.id
  end

end

