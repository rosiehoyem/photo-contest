class Image < ActiveRecord::Base
	belongs_to :contest
	belongs_to :round
end
