class Checkin < ActiveRecord::Base

  validates_presence_of :resource_id, :user_id

  belongs_to :resource
  belongs_to :user

  has_attached_file :image, :styles => { :square => "100x100#"}

  def user_image
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.user.email.strip.downcase)}?s=60&d=wavatar"
  end

end