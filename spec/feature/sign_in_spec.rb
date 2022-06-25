require 'rails_helper'

RSpec.describe 'Sign In page' do
  it 'Displays heading "Log in"' do
    visit('/users/sign_in')
    expect(page).to have_content('Log in')
  end

  it 'Has email lable' do
    visit('/users/sign_in')
    expect(page).to have_content('Email')
  end

  it 'Has Remember me checkbox' do
    visit('/users/sign_in')
    expect(page).to have_content('Remember me')
  end

  it 'Has sign up link' do
    visit('/users/sign_in')
    expect(page).to have_content('Sign up')
  end

  it 'Has Forgot your password? link' do
    visit('/users/sign_in')
    expect(page).to have_content('Forgot your password?')
  end
end
