class Family < ActiveRecord::Base
	has_many :kids
	has_many :sits
	#this is a comment
end
