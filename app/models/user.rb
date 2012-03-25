class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  has_many :checkins
  has_many :follows, :foreign_key => :owner_id
  has_many :followers, :class_name => 'Follow', :foreign_key => :followed_id

  def follow( other_user )
    raise Exception.new("Cant follow yourself") if self == other_user
    followed = self.follows.where( :followed_id => other_user.id ).first
    unless followed
      self.follows.create!( :followed_id => other_user.id )
    end
  end

  def checkin( resource, comment )
    self.checkins.create( :resource_id => resource.id, :comment => comment )
  end

  def to_json(options = {})
    super( {:only => [ :id, :name, :email ]}.merge(options) )
  end


end
