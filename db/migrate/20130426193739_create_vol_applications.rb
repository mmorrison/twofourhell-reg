class CreateVolApplications < ActiveRecord::Migration
  def change
    create_table :vol_applications, :id => false do |t|
      t.uuid :id, :primary_key => true, :default => "uuid_generate_v4()"
      t.integer :year
      t.string :preferred_teams, :array => true, :default => "{}"
      t.string :preferred_teammates, :array => true
      t.string :event_availability, :array => true, :default => "{}"
      t.references :team
      t.timestamps
    end
  end
end
