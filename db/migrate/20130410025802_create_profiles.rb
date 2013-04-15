class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.string :tshirt_size
      t.text :notes
      t.timestamps
    end
  end
end
