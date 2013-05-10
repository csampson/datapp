class App < ActiveRecord::Base
  attr_accessible :application_url, :image, :name, :organization, :organization_site, :description, :published

  scope :published, where(:published => true)

  def publish!
    self.published = true
    save!
    Twitter.update("#{organization} just published an app. Check it out #{name} here http://nola-apps.com/apps/#{id}")
  end

end
