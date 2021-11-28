require 'rails_helper'

RSpec.describe 'Tickets view', type: :system do
    name = 'Inception'
    let!(:movie) { create(:movie, name: name, matinee: ['Sala1']) }
    let!(:showtime1) { create(:showtime, movie: movie, schedule: 'Matinee', theater: 'Sala1') }

    before :each do
        image1 = File.open('download.jpeg')
        movie.image.attach(io: image1, filename: 'image1.jpeg', content_type: 'image/jpeg')
    end
    
    describe 'Buy' do
        buyer = 'Kitty'
        it 'Buy new ticket correctly' do
            visit movie_path(movie)

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
            visit movie_path(movie)

            find(:xpath, "//tr[td[contains(.,'Matinee')]]/td/a", :text => 'Buy Tickets').click

            fill_in 'User Name', with: buyer
            select "B", :from => "Row"
            page.check('ticket[seat-1]')
            click_button 'Accept'
            
            find(:xpath, "//tr[td[contains(.,'Matinee')]]/td/a", :text => 'Buy Ticket').click

            td = find_by_id('seat-B-1')
            expect(td).to have_content('X')

            td = find_by_id('seat-B-2')
            expect(td).to have_no_content()

            click_link 'Back'
            find(:xpath, "//tr[td[contains(.,'Matinee')]]/td/a", :text => 'View Tickets').click

            expect(page).to have_content("Tickets")

            page.all('tr').each do |tr|
                next unless tr.has_css?('td.user', text: buyer)
                expect(tr).to have_css('td.row', text: "B")
                expect(tr).to have_css('td.seat', text: "1")
            end
        end
    end
end
