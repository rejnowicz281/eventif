class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :end_event, :resume_event]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy

    redirect_to root_path
  end

  # NON-CRUD actions
  def end_event
    if @event.update(end_date: Date.today)
      redirect_to @event
    end
  end

  def resume_event
    if @event.update(end_date: nil)
      redirect_to @event
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :start_date)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
