class Sitter < ActiveRecord::Base
	has_many :sits

  def self.search(params)

    puts params

  end
end
