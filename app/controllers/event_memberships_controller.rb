class EventMembershipsController < ApplicationController
  before_action :set_event, only: %i[create]

  def create
    @membership = if @event.private
                    EventMembership.new(user: current_user, event: @event)
                  else
                    EventMembership.new(user: current_user, event: @event, accepted: true)
                  end

    authorize @membership

    @membership.save

    redirect_to @event
  end

  def destroy
    @membership = EventMembership.find_by(event_id: params[:id], user_id: params[:user_id])

    authorize @membership

    @membership.destroy

    redirect_to "/events/#{params[:id]}"
  end

  # NON-CRUD actions
  def accept
    @membership = EventMembership.find_by(event_id: params[:id], user_id: params[:user_id])

    authorize @membership

    @membership.update(accepted: true)

    redirect_to "/events/#{params[:id]}"
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
