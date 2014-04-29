class Family < ActiveRecord::Base
	has_many :kids
	has_many :sits
end
