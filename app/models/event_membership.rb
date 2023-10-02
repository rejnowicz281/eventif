class EventMembership < ApplicationRecord
  belongs_to :member, class_name: "User"
  belongs_to :event
end
