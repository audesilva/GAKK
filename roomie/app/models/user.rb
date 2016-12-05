class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, :dependent => :destroy
  has_one :preferences, :dependent => :destroy

  acts_as_messageable

	scope :with_profile, -> { where('EXISTS(SELECT 1 FROM profiles WHERE user_id = users.id)') }


  def mailboxer_name
    self.user_id
  end

  def mailboxer_email(object)
    #puts "user email was accessed"
    #puts self.email
    self.email
	end

end
