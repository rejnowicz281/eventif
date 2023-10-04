class EventsController < ApplicationController
  before_action :set_event, only: %i[
    show edit update destroy
    end_event resume_event make_private make_public
  ]

  def index
    @events = Event.all
  end

  def show; end

  def new
    authorize Event

    @event = current_user.created_events.build
  end

  def create
    authorize Event

    @event = current_user.created_events.build(event_params)

    if @event.save
      flash[:success] = 'Event created successfully.'
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @event
  end

  def update
    authorize @event

    if @event.update(event_params)
      flash[:success] = 'Event updated successfully.'
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @event

    @event.destroy

    flash[:success] = 'Event deleted successfully.'
    redirect_to root_path
  end

  # NON-CRUD actions
  def end_event
    authorize @event

    return unless @event.update(end_date: DateTime.now)

    redirect_to @event
  end

  def resume_event
    authorize @event

    return unless @event.update(end_date: nil)

    redirect_to @event
  end

  def make_private
    authorize @event

    return unless @event.update(private: true)

    redirect_to @event
  end

  def make_public
    authorize @event

    return unless @event.update(private: false)

    redirect_to @event
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_date, :private)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
