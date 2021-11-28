require 'rails_helper'

RSpec.describe 'Showtimes', type: :system do
    describe 'Show' do
        name = 'Deadpool'
        let!(:movie) { create(:movie, name: name, matinee: ['Sala1']) }
        let!(:showtime1) { create(:showtime, movie: movie, schedule: 'Matinee', theater: 'Sala1') }

        before :each do
            image1 = File.open('download.jpeg')
            movie.image.attach(io: image1, filename: 'image1.jpeg', content_type: 'image/jpeg')
        end
        it 'Created movie is shown' do
            visit '/'
            expect(page).to have_content('Showtimes')
            expect(page).to have_content(name)
        end

        it 'Correct schedule and theater' do
            visit '/'

            page.all('tr').each do |tr|
                next unless tr.has_css?('td.name', text: name)
                expect(tr).to have_css('td.schedule', text: "Matinee")
                expect(tr).to have_css('td.theater', text: "Sala1")
            end
        end
    end
end
