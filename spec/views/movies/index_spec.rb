require 'rails_helper'

RSpec.describe 'Movies view', type: :system do
  describe 'Create' do
    it 'Create new movie correctly' do
      visit new_movie_path
      find('h3', text: 'Creating Movie')
      expect(page).to have_content('Creating Movie')
    end
  end
end
