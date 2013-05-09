class App < ActiveRecord::Base
  attr_accessible :application_url, :image, :name, :organization, :organization_site
end
