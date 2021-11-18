require 'rails_helper'

RSpec.describe 'Movies view', type: :system do
  describe 'Create' do
    it 'Create new movie correctly' do
      visit new_movie_path
      find('h3', text: 'Creating Movie')
      expect(page).to have_content('Creating Movie')

      name = 'Attack on Titans'

      fill_in 'Name', with: name
      attach_file('Image', 'download.jpeg')
      page.check('movie[Matinee-Sala1]')
      page.check('movie[Tanda-Sala1]')
      page.check('movie[Night-Sala1]')
      click_button 'Accept'

      expect(page).to have_content(name)
    end
  end
end
