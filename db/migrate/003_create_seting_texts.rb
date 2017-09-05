class CreateSetingTexts < ActiveRecord::Migration
  def self.up
    create_table :seting_texts do |t|
      t.belongs_to :list_hook, index: true
      t.belongs_to :text_hook, index: true
    end
  end
  def self.down
    drop_table :seting_texts
  end
end
