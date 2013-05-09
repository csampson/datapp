class AddPublishingStuffToApps < ActiveRecord::Migration
  def change
    add_column :apps, :published, :boolean, :default => false, :nil => false
  end
end
