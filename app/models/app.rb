class App < ActiveRecord::Base
  attr_accessible :application_url, :image, :name, :developer, :contact_email, :description, :published
  validates_presence_of :developer, :application_url, :name, :description, :contact_email

  has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "300x300>" }, :default_url => "/images/apps/missing.png"

  scope :published, where(:published => true)

  def publish!
    self.published = true
    save!
    AdminMailer.app_published(self).deliver
    Twitter.update("We just published a new app \"#{name}\" by @#{developer}. Check it out here http://nola-apps.com/apps/#{id}")
  end

end
