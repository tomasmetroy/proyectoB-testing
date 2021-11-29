# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movies', type: :system do
  describe 'Create' do
    name = 'Deadpool'
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

  describe 'Show' do
    names = ['Attack on Titans', 'Inception']
    let!(:movie1) { create(:movie, name: names[0], matinee: ['Sala1']) }
    let!(:movie2) { create(:movie, name: names[1], night: ['Sala2']) }

    it 'Should show created movies' do
      image1 = File.open('download.jpeg')
      image2 = File.open('download.jpeg')
      movie1.image.attach(io: image1, filename: 'image1.jpeg', content_type: 'image/jpeg')
      movie2.image.attach(io: image2, filename: 'image2.jpeg', content_type: 'image/jpeg')

      visit movies_path

      page.all('ul').each do |ul|
        next unless ul.has_css?('h2', text: names[0])
        expect(ul).to have_css('li.matinee', text: 'Matinee: ["Sala1"]')
      end

      page.all('ul').each do |ul|
        next unless ul.has_css?('h2', text: names[1])
        expect(ul).to have_css('li.night', text: 'Night: ["Sala2"]')
      end
    end
  end
end
