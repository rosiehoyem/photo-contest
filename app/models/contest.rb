class Contest < ActiveRecord::Base
  has_many :rounds
  has_many :images
  validates :api_key, presence: true
  include HTTParty

  def self.initialize_contest
    response = HTTParty.post('http://pv.pop.umn.edu/contest/strike-near-none-clock-paris-58/reset')
    @status = response.headers["status"]
    info = HTTParty.get('http://pv.pop.umn.edu/contest/strike-near-none-clock-paris-58')
    self.name = info["contest"]["name"]
    self.active_round = info["contest"]["active_round"]
  end

  def self.build_images
    image_string = HTTParty.get('http://pv.pop.umn.edu/contest/strike-near-none-clock-paris-58/images')
    image_array = JSON.parse(image_string)
    image_array.each do |hash|
      self.images.create(
      contest_id: self.id,
      flicker_id: hash["image"]["flickr_id"],
      owner: hash["image"]["owner"],
      title: hash["image"]["title"],
      url: hash["image"]["url"])
    end
  end

  def self.contest_status
    status = HTTParty.get('http://pv.pop.umn.edu/contest/strike-near-none-clock-paris-58')
    parsed_status = JSON.parse(status)
    self.active_round = info["contest"]["active_round"]
    self.posted = info["contest"]["active_round"]
  end

  def self.build_round

  end

  def final_round?

  end

end

