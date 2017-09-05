class CreateListHooks < ActiveRecord::Migration
  def self.up
    create_table :list_hooks do |t|
      t.string :name
    end
    require 'yaml_db' # create list
  end

  def self.down
    drop_table :list_hooks
  end
end
