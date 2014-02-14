class Round < ActiveRecord::Base
	belongs_to :contest
	has_many :images
end
