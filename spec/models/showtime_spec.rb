require 'rails_helper'

RSpec.describe Showtime, type: :model do
  context 'associations' do
    it { should belong_to(:movie) }
    it { should have_many(:tickets) }
  end
end
