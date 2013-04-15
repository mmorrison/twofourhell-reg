class AddAgeGroupToProfile < ActiveRecord::Migration
  def change
  	add_column :profiles, :age_group, :integer
  end
end
