class App < ActiveRecord::Base
  attr_accessible :application_url, :image, :name, :organization, :organization_site, :description, :published

  scope :published, where(:published => true)
end
