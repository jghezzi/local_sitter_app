class Kid < ActiveRecord::Base
	belongs_to :parent
	has_many :sits through :families
	validates :age, numericailty: true
	validates :gender, :family_id, presence: true
end
