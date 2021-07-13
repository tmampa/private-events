class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @created_events = @user.events
    @past_events = @user.attending_events.past
    @upcoming_events = @user.attending_events.upcoming
  end
end
