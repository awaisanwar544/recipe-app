require 'rails_helper'

RSpec.describe 'Public Recipes page' do
  it 'Displays heading "All public recipes"' do
    visit('/public_recipes')
    expect(page).to have_content('All Public Recipes')
  end
end
