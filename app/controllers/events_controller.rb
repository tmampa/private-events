class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new]

  def new
    @event = Event.new
  end

  def index
    @events = Event.all.order('created_at DESC')
    @upcoming = Event.upcoming
    @past = Event.past
  end

  def create
    user = User.find(current_user.id)
    user.events
    @event = user.events.build(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :date)
  end
end
