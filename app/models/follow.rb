class Follow < ActiveRecord::Base

  validates_presence_of :owner_id, :followed_id

  belongs_to :owner, :class_name => 'User'
  belongs_to :followed, :class_name => 'User'

end