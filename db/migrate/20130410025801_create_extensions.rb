class CreateExtensions < ActiveRecord::Migration
  def up
    execute 'CREATE EXTENSION hstore'
    execute 'CREATE EXTENSION "uuid-ossp"'
  end
end