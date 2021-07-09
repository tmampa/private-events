module UsersHelper
  def attended_events
    @attended = AttendedEvent.where('user_id = ?', current_user.id)
  end
end
