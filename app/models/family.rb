class Family < ActiveRecord::Base
	has_many :kids, :dependent => :destroy
	has_many :sits
  belongs_to :user
  accepts_nested_attributes_for :kids
end
