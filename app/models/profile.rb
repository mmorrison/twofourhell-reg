class Profile < ActiveRecord::Base
	validates :name, :email, :mobile, :tshirt_size, :age_group, presence: true
	validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true

  before_create :generate_confirm_token
  after_create :send_confirmation_email

  has_one :volunteer

  def generate_confirm_token
    self.confirm_token = Digest::SHA2.hexdigest("#{self.email}#{Time.now.to_i}")
  end

  def send_confirmation_email
    UserMailer.confirm_email(self).deliver
  end
end
