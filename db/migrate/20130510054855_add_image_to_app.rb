class AddImageToApp < ActiveRecord::Migration
  def change
    add_attachment :apps, :image
  end
end
