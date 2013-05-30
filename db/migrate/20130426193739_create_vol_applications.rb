class CreateVolApplications < ActiveRecord::Migration
  def change
    create_table :vol_applications, :id => false do |t|
      t.uuid :id, :primary_key => true, :default => "uuid_generate_v4()"
      t.integer :year
      t.hstore :preferred_teams
      t.hstore :preferred_teammates
      t.hstore :event_availability
      t.references :team
    end
  end
end
