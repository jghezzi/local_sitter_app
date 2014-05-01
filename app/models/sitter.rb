class Sitter < ActiveRecord::Base
	has_many :sits

  #change schema. add to schema to support this search
  #scope :sitters_available, (date) -> {where()}


  def self.search(params)
    date = params[:date]
    name = params[:name]
    

    case 
    when date.present? && name.present?
      puts 'both'
    when date.present?
      puts "date"
    else
      @sitters = Sitter.where(:name => name)
    end
  end
end
