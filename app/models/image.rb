class Image < ActiveRecord::Base
	belongs_to :contest
	belongs_to :round
  validates :flickr_id, :owner, :title, :url, presence: true

  def eliminate
    self.in_competition = false
  end

end
