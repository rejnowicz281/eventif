class EventMembershipsController < ApplicationController
  before_action :set_event, only: %i[create destroy accept]

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
    @membership = EventMembership.find_by(event: @event, user_id: params[:user_id])

    authorize @membership

    @membership.destroy

    redirect_to @event
  end

  # NON-CRUD actions
  def accept
    @membership = EventMembership.find_by(event: @event, user_id: params[:user_id])

    authorize @membership

    @membership.update(accepted: true)

    redirect_to @event
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
