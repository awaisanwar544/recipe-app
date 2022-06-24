require 'rails_helper'

RSpec.describe 'Home Page Content' do
  it 'Displays a welcome Note' do
    visit('/')
    expect(page).to have_content('Welcome to Recipe App')
  end

  it 'Has link for home' do
    visit('/')
    expect(page).to have_content('Home')
  end

  it 'Has link for Public Recipes' do
    visit('/')
    expect(page).to have_content('Public Recipes')
  end

  it 'Has link for Sign In' do
    visit('/')
    expect(page).to have_content('Sign In')
  end

  it 'Has link for Register' do
    visit('/')
    expect(page).to have_content('Register')
  end
end
