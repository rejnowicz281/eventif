class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :comments, class_name: 'EventComment', dependent: :destroy

  has_many :event_memberships, dependent: :destroy
  has_many :members, class_name: 'User', source: :user, through: :event_memberships
  has_many :accepted_members, lambda {
                                where(event_memberships: { accepted: true })
                              }, class_name: 'User', source: :user, through: :event_memberships
  has_many :non_accepted_members, lambda {
                                    where(event_memberships: { accepted: false })
                                  }, class_name: 'User', source: :user, through: :event_memberships

  validates_presence_of :name
  validates_presence_of :start_date, message: 'must be set'
end
