class Volunteer < ActiveRecord::Base

  belongs_to :profile
  has_many :volunteer_applications

end
