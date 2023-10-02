class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"

    validates_presence_of :name
    validates_presence_of :start_date, message: "must be set"
end
