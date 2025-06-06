class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:site_admin], multiple: false)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name

  has_many :comments, dependent: :destroy

  # after_create :assign_first_user_as_admin

  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end

  # # assign first user as site admin automatically
  # def assign_first_user_as_admin
  #   if User.count == 1
  #     self.update(role: 'site_admin')
  #   end
  # end
end