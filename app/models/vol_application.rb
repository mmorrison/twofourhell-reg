class VolApplication < ActiveRecord::Base

  belongs_to :volunteer
  belongs_to :team

end