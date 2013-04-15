class Profile < ActiveRecord::Base
	validates :name, :email, :mobile, :tshirt_size, :age_group, presence: true
	validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
end
