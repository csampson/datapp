class App < ActiveRecord::Base
  attr_accessible :application_url, :image, :name, :developer, :organization_site, :description, :published
  validates_presence_of :developer, :application_url, :name, :description

  scope :published, where(:published => true)

  def publish!
    self.published = true
    save!
    #Twitter.update("#{organization} just published an app. Check out #{name} here http://nola-apps.com/apps/#{id}")
  end

end
