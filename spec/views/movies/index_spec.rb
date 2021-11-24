require 'rails_helper'

RSpec.describe 'Movies', type: :system do
  describe 'Create' do
    name = 'Attack on Titans'

    it 'Should create new movie correctly' do
      visit new_movie_path
      find('h3', text: 'Creating Movie')
      expect(page).to have_content('Creating Movie')

      fill_in 'Name', with: name
      attach_file('Image', 'download.jpeg')
      page.check('movie[Matinee-Sala1]')
      page.check('movie[Tanda-Sala1]')
      page.check('movie[Night-Sala1]')
      click_button 'Accept'

      expect(page).to have_content(name)
    end

    it 'Should check that used theater room cannot be chosen' do
      visit new_movie_path

      fill_in 'Name', with: name
      attach_file('Image', 'download.jpeg')
      page.check('movie[Matinee-Sala1]')
      click_button 'Accept'

      visit new_movie_path

      expect(page).not_to have_content('movie[Matinee-Sala1]')
    end
  end
end
