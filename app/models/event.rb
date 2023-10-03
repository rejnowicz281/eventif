class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    
    has_many :comments, class_name: "EventComment", dependent: :destroy

    has_many :event_memberships, dependent: :destroy

    validates_presence_of :name
    validates_presence_of :start_date, message: "must be set"

    def accepted_members
        event_memberships = self.event_memberships.where(accepted: true)
        arr = []
        event_memberships.each { |event_membership| arr.append(event_membership.user) } if !event_memberships.empty?
        arr
    end

    def non_accepted_members
        event_memberships = self.event_memberships.where(accepted: false)
        arr = []
        event_memberships.each { |event_membership| arr.append(event_membership.user) } if !event_memberships.empty?
        arr
      end
end
