class Preferences < ApplicationRecord
	validates :postal_code,:allow_blank => true, :numericality => {:only_integer => true}
	belongs_to :user
end
