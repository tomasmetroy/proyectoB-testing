require 'rails_helper'

RSpec.describe Schedule, type: :model do
  context 'associations' do
    it { should have_many(:showtimes) }
  end
end
