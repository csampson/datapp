class AddDescriptionToApp < ActiveRecord::Migration
  def change
    add_column :apps, :description, :text
  end
end
