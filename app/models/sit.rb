class Sit < ActiveRecord::Base
	has_many :families
	has_many :sitters
end
