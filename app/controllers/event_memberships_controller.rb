class EventMembershipsController < ApplicationController
    before_action :set_event, only: [:create, :destroy, :accept]

    def create
        if @event.private
            @membership = EventMembership.create(user: current_user, event: @event)
        else
            @membership = EventMembership.create(user: current_user, event: @event, accepted: true)
        end

        redirect_to @event
    end

    def destroy
        @membership = EventMembership.find_by(event: @event, user_id: params[:user_id])

        @membership.destroy

        redirect_to @event
    end

    # NON-CRUD actions
    def accept
        @membership = EventMembership.find_by(event: @event, user_id: params[:user_id])

        @membership.update(accepted: true)

        redirect_to @event
    end

    private
    def set_event
        @event = Event.find(params[:id])
    end
end
