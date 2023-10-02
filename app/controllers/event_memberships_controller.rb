class EventMembershipsController < ApplicationController
    before_action :set_event, only: [:create, :destroy]

    def create
        @membership = EventMembership.create(user: current_user, event: @event)

        redirect_to @event
    end

    def destroy
        @membership = EventMembership.find_by(user: @event)

        @membership.destroy

        redirect_to @event
    end

    private
    def set_event
        @event = Event.find(params[:id])
    end
end
