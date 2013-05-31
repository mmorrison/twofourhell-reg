class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers, :id => false do |t|
      t.uuid :id, :primary_key => true, :default => "uuid_generate_v4()"
      t.uuid :profile_id
      t.string :certifications, :array => true, :default => "{}"
      t.string :equipment, :array => true, :default => "{}"
      t.string :years_volunteered, :array => true, :default => "{}"
      t.text :qualification
      t.text :internal_notes
      t.boolean :starred?, :default => false
      t.string :status
      t.timestamps
    end
  end
end
