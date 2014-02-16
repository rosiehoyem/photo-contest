class Round < ActiveRecord::Base
	belongs_to :contest
	has_many :images

	def round_parse(string)

  end

  def round_id
    self.number
  end

	def new_round(round)

  end

end
