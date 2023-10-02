class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :validatable

  has_many :created_events, class_name: "Event", foreign_key: "creator_id", dependent: :destroy
  
  has_many :event_memberships, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def joined_events
    event_memberships = self.event_memberships.where(accepted: true)
    arr = []
    event_memberships.each { |event_membership| arr.append(event_membership.event) } if !event_memberships.empty?
    arr
  end

  def pending_membership_events
    event_memberships = self.event_memberships.where(accepted: false)
    arr = []
    event_memberships.each { |event_membership| arr.append(event_membership.event) } if !event_memberships.empty?
    arr
  end
end
