class VolApplication < ActiveRecord::Base

  belongs_to :volunteer
  belongs_to :team

  validates :do_you_agree, :acceptance => true
  validates :event_availability, :presence => true

  attr_accessor :do_you_agree

end