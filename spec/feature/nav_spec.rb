require 'rails_helper'

RSpec.describe 'Navigation is Working' do
  it 'Home link takes to the root_path' do
    visit('/')
    click_link('Home')
    expect(current_path).to eql('/')
  end

  it 'Public Recipes link takes to the "/public_recipes"' do
    visit('/')
    click_link('Public Recipes')
    expect(current_path).to eql('/public_recipes')
  end

  it 'Sign In link takes to the "/users/sign_in"' do
    visit('/')
    click_link('Sign In')
    expect(current_path).to eql('/users/sign_in')
  end

  it 'Register link takes to the "/users/sign_up"' do
    visit('/')
    click_link('Register')
    expect(current_path).to eql('/users/sign_up')
  end
end
