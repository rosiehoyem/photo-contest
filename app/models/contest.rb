class Contest < ActiveRecord::Base
	has_many :rounds
	has_many :images
end
