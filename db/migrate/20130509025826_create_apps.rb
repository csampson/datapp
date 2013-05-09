class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :organization
      t.string :organization_site
      t.string :application_url
      t.string :image

      t.timestamps
    end
  end
end
