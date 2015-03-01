require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

# Feature: Create new city
#   As a user
#   I want to create new city
feature 'Create city' do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do 
    login_as(user, scope: :user)
    visit cities_path
  end

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User can create new city with valid parameters
  #   Given I am signed in
  #   When I visit the new city page
  #   And I create new city
  #   Then I see created city in cities table
  scenario 'user creates new city' do
    create_city('London', 'Ld')
    expect(page).to have_content('City was successfully created.')
    expect(page).to have_content('London')
  end

  # Scenario: User cannot create new city without short name
  #   Given I am signed in
  #   When I visit the new city page
  #   And I create city without short name
  #   Then I see a missing short name message
  scenario 'user cannot create new city without short name' do
    create_city('London', '')
    expect(page).to have_content("Short name can't be blank")
  end

  # Scenario: User cannot create new city without short name
  #   Given I am signed in
  #   When I visit the new city page
  #   And I create city without name
  #   Then I see a missing name message
  scenario 'user cannot create new city without name' do
    create_city('', 'Ld')
    expect(page).to have_content("Name can't be blank")
  end

  # Scenario: User cannot create new city with too short name
  #   Given I am signed in
  #   When I visit the new city page
  #   And I create city with too short name
  #   Then I see a too short name message
  scenario 'user cannot create new city without name' do
    create_city('abc', 'Ld')
    expect(page).to have_content("Name is too short")
  end
end
