class Profile < ApplicationRecord
	validates :user_name, presence: true, uniqueness: true, :format => {:with => /\A[a-zA-Z\d\-\s]+\z/, :message => "only allows letters, spaces, numbers and dashes"}
	validates :postal_code,:allow_blank => true, :numericality => {:only_integer => true, :greater_than => 0}, :length => { is: 5 }
	validates :gender, presence: true
	validates :cleanliness_level, presence: true
	validates :outgoingness_level, presence: true
	validates :quietness_level, presence: true

	validates :street, :format => {:with => /\A[a-zA-Z\d\-\s]+\z/, :message => "only allows letters, spaces, numbers and dashes"}, :if => :has_residence_already
 	validates :city, :format => {:with => /\A[a-zA-Z\d\-\s]+\z/, :message => "only allows letters, spaces, numbers and dashes"}, :if => :has_residence_already
	validate :is_a_smoker_presence
	validate :pet_friendly_presence



	validates_presence_of :street, :city, :state, :postal_code, :if => :has_residence_already

	geocoded_by :full_street_address   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates

	has_many :pictures, :dependent => :destroy
	
	def is_a_smoker_presence
		errors.add(:is_a_smoker, "can't be blank") if is_a_smoker.nil?
	end

	def pet_friendly_presence
		errors.add(:pet_friendly, "can't be blank") if pet_friendly.nil?
	end

	def full_street_address
		[street, city, state, postal_code].compact.join(', ')
	end

	belongs_to :user

	def self.profileGender
		[
			nil,
	 		'Male',
			'Female',
			'Non-Binary'
		]
	end

	def self.profileIsASmoker
		{
			' ': nil,
			'No': false,
			'Yes': true
		}
	end

	def self.profilePetFriendly
		{
			' ': nil,
			'No': false,
			'Yes': true
		}
	end

	def self.profileCleanlinessLevel
		{
			' ': nil,
			'Some might call me a slob': 1,
			'A bit messy': 2,
			'Average': 3,
			'Nice and tidy': 4,
			'Neat. Freak.': 5
		}
	end

	def self.profileOutgoingnessLevel
		{
			' ': nil,
			'Not even at the party': 1,
			'Wallflower': 2,
            'I stick to the people I know': 3,
            'I like meeting new people': 4,
            'I am the loudest one there': 5
		}
	end

	def self.profileQuietnessLevel
		{
			' ': nil,
			"You probably won't know I'm home": 1,
			'On the quieter side': 2,
           	'Somewhere in the middle. Considerate': 3,
           	'I like things a big louder': 4,
           	'I have awesome taste in music, and I want to share it with EVERYBODY': 5
		}
	end
end
