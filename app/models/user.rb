class User < ActiveRecord::Base
  rolify
  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :person_attributes, :uid, :provider

  has_many :publications
  has_one :person

  accepts_nested_attributes_for :person
  validates_associated :person

  private
  
    def assign_default_role
    	add_role(:free)
    end

end
