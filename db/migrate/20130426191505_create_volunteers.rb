class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers, :id => false do |t|
      t.uuid :id, :primary_key => true, :default => "uuid_generate_v4()"
      t.references :profile
      t.hstore :certifications
      t.hstore :equipment
      t.hstore :years_volunteered
      t.text :qualification
      t.text :internal_notes
      t.boolean :starred?, :default => false
      t.string :status
    end
  end
end
