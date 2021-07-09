class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:sign_in]

  def show
    @created_events = current_user.events
    @upcoming_events = current_user.attendances.upcoming
    @previous_events = current_user.attendances.previous
  end
end
