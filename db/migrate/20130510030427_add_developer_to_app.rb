class AddDeveloperToApp < ActiveRecord::Migration
  def change
    add_column :apps, :developer, :string
  end
end
