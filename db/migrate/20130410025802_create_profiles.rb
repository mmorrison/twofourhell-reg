class CreateProfiles < ActiveRecord::Migration

  def up
    execute 'CREATE EXTENSION hstore'
  end

  def change
    create_table :profiles, :id => false do |t|
      t.uuid :id, :primary_key => true, :default => "uuid_generate_v4()"
      t.string :name
      t.string :email
      t.string :mobile
      t.string :tshirt_size
      t.text :notes
      t.timestamps
    end
  end
end
