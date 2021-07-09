require 'rails_helper'

RSpec.describe AttendedEvent, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:event).class_name('Event') }
  end
end
