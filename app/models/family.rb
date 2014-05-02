class Family < ActiveRecord::Base
	has_many :kids, :dependent => :destroy
	has_many :sits
  accepts_nested_attributes_for :kids
end
