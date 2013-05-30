class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams, :id => false do |t|
      t.uuid :id, :primary_key => true, :default => "uuid_generate_v4()"
      t.string :name
      t.boolean :special
      t.timestamps
    end
  end
end
