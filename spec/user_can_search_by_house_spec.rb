require 'rails_helper'

describe 'User searching for a house' do
  it 'returns a list of members of house slytherin' do
    visit '/'

    page.select 'Slytherin', from: 'house'

    click_on 'Get Students'

    expect(current_url).to include('house=Slytherin')

    expect(page).to have_content('22 Students')
    expect(page).to have_css('.student', count: 22)

    within(first('.student')) do
      expect(page).to have_css('.name')
      expect(page).to have_css('.student-id')
    end
  end
end
