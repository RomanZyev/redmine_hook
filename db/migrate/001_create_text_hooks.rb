class CreateTextHooks < ActiveRecord::Migration
  def self.up
    create_table :text_hooks do |t|
      t.text :txt
    end
  end
 def self.down
    drop_table :text_hooks
  end
 end
