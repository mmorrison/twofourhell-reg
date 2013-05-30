class ReferenceVolInVolapp < ActiveRecord::Migration
  def change
    add_column :vol_applications, :volunteer_id, :uuid
  end
end
