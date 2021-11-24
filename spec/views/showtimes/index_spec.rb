require 'rails_helper'

RSpec.describe 'Showtimes', type: :system do
    describe 'Verify' do
        name = 'Attack on Titans'

        it 'Created movie is shown' do
            visit new_movie_path

            fill_in 'Name', with: name
            attach_file('Image', 'download.jpeg')
            page.check('movie[Matinee-Sala1]')
            page.check('movie[Tanda-Sala1]')
            page.check('movie[Night-Sala1]')
            click_button 'Accept'

            visit '/'
            expect(page).to have_content('Showtimes')
            expect(page).to have_content(name)
        end

        it 'Correct schedule and theater' do
            visit new_movie_path 

            fill_in 'Name', with: name
            attach_file('Image', 'download.jpeg')
            page.check('movie[Matinee-Sala1]')
            click_button 'Accept'

            visit '/'

            page.all('tr').each do |tr|
                next unless tr.has_css?('td.name', text: name)
                expect(tr).to have_css('td.schedule', text: "Matinee")
                expect(tr).to have_css('td.theater', text: "Sala1")
            end 
        end

        
    end
end