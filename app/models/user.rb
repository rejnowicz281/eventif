class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :validatable

  has_many :created_events, class_name: "Event", foreign_key: "creator_id", dependent: :destroy
  
  has_many :event_memberships, dependent: :destroy
  has_many :joined_events, source: :event, through: :event_memberships

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end 
end
