class Monster < ActiveRecord::Base
	belongs_to :user
	validates :name,:power,:presence => true

	private
	 def self.inheritance_column
    	nil
  	 end
end
