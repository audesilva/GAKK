class Preferences < ApplicationRecord
	validates :postal_code,:allow_blank => true, :numericality => {:only_integer => true, :greater_than => 0}, :length => { is: 5 }
	validates :street, :format => {:with => /\A[a-zA-Z\d\-\s]+\z/, :message => "only allows letters, spaces, numbers and dashes"}, :if => :looking_for_residence
	validates :city, :format => {:with => /\A[a-zA-Z\d\-\s]+\z/, :message => "only allows letters, spaces, numbers and dashes"}, :if => :looking_for_residence
	

	validates :gender, presence: true
	validates :cleanliness_level, presence: true
	validates :outgoingness_level, presence: true
	validates :quietness_level, presence: true

	validate :smoker_presence
	validate :pet_friendly_presence

	validates_presence_of :street, :city, :state, :postal_code, :if => :looking_for_residence

	geocoded_by :full_street_address   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates
	
	def smoker_presence
		errors.add(:smoker, "can't be blank") if smoker.nil?
	end

	def pet_friendly_presence
		errors.add(:pet_friendly, "can't be blank") if pet_friendly.nil?
	end

	def full_street_address
		[street, city, state, postal_code].compact.join(', ')
	end

	belongs_to :user

	def self.preferencesGender
		[
			nil,
	 		'Male',
			'Female',
			'Non-Binary'
		]
	end

	def self.preferencesSmoker
		{
			' ': nil,
			'No': false,
			'Yes': true
		}
	end

	def self.preferencesPetFriendly
		{
			' ': nil,
			'No': false,
			'Yes': true
		}
	end

	def self.preferencesCleanlinessLevel
		{
			' ': nil,
			'I want to be matched with a slob': 1,
			'Slightly messy': 2,
			'Average': 3,
			'Clean': 4,
			'I expect the apartment to sparkle': 5
		}
	end

	def self.preferencesOutgoingnessLevel
		{
			' ': nil,
			'I want a roommate that guards the apartment 25-8': 1,
			'I want a roommate thats not too outgoing': 2,
            'I just want a normal roommate...': 3,
            'I want a roommate that likes meeting new people often': 4,
            'I want a roommate that will be heard from a mile away': 5
		}
	end

	def self.preferencesQuietnessLevel
		{
			' ': nil,
			"If I hear them I don't want them": 1,
			'On the quieter side': 2,
           	'Somewhere in the middle. Considerate': 3,
           	'A vocal roommate': 4,
           	'I was going to buy noise-cancelling headphones anyway': 5
		}
	end
end


