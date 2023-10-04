class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id', dependent: :destroy

  has_many :event_memberships, dependent: :destroy
  has_many :membership_events, class_name: 'Event', source: :event, through: :event_memberships
  has_many :accepted_membership_events, lambda {
    where(event_memberships: { accepted: true })
  }, class_name: 'Event', source: :event, through: :event_memberships

  has_many :non_accepted_membership_events, lambda {
                                              where(event_memberships: { accepted: false })
                                            }, class_name: 'Event', source: :event, through: :event_memberships

  has_many :event_comments, foreign_key: 'author_id', dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
