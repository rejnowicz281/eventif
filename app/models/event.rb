class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    
    has_many :event_memberships, dependent: :destroy
    has_many :members, source: :user, through: :event_memberships

    validates_presence_of :name
    validates_presence_of :start_date, message: "must be set"
end
