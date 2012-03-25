class Resource < ActiveRecord::Base

  validates_presence_of :name, :description

  has_attached_file :image, :styles => { :small => "20x20#"}


end