class App < ActiveRecord::Base
  attr_accessible :application_url, :image, :name, :developer, :organization_site, :description, :published
  validates_presence_of :developer, :application_url, :name, :description

  has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "300x300>" }, :default_url => "/images/apps/missing.png"

  scope :published, where(:published => true)

  def publish!
    self.published = true
    save!
    #Twitter.update("We just published a new app from #{organization}. Check out #{name} here http://nola-apps.com/apps/#{id}")
  end

end
