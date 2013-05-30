class AddProfileConfirmToken < ActiveRecord::Migration
  def change
    add_column :profiles, :confirm_token, :string
  end
end
