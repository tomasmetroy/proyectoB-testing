require 'rails_helper'

RSpec.describe 'Tickets view', type: :system do
    describe 'Buy' do
        name = "Inception"
        buyer = "Kitty"
        
        it 'Buy new ticket correctly' do
            visit new_movie_path

            fill_in 'Name', with: name
            attach_file('Image', 'download.jpeg')
            page.check('movie[Matinee-Sala1]')
            click_button 'Accept'
        
            # click_button 'Buy Tickets'
            find(:xpath, "//tr[td[contains(.,'Matinee')]]/td/a", :text => 'Buy Tickets').click

            expect(page).to have_content("Creating Tickets")

            fill_in 'User Name', with: buyer
            select "B", :from => "Row"
            page.check('ticket[seat-1]')
            page.check('ticket[seat-3]')
            click_button 'Accept'
            expect(page).to have_content('Ticket bought correctly!')
        end
        
        it 'Display purchased tickets correctly' do
            visit new_movie_path

            fill_in 'Name', with: name
            attach_file('Image', 'download.jpeg')
            page.check('movie[Matinee-Sala1]')
            click_button 'Accept'
        
            # click_button 'Buy Tickets'
            find(:xpath, "//tr[td[contains(.,'Matinee')]]/td/a", :text => 'Buy Tickets').click

            fill_in 'User Name', with: buyer
            select "B", :from => "Row"
            page.check('ticket[seat-1]')
            page.check('ticket[seat-3]')
            click_button 'Accept'
            
            find(:xpath, "//tr[td[contains(.,'Matinee')]]/td/a", :text => 'Buy Ticket').click

            td = find_by_id('seat-B-1')
            expect(td).to have_content('X')

            td = find_by_id('seat-B-2')
            expect(td).to have_no_content()

            td = find_by_id('seat-B-3')
            expect(td).to have_content('X')

            # click_button 'Back'
            # click_button 'View Tickets'

        end
    end
end
