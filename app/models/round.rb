class Round < ActiveRecord::Base
	belongs_to :contest
	has_many :images

	def round_pair

	end

	def new_round

  end

end
