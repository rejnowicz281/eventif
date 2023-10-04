class EventComment < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :event

  validates_presence_of :body
end
