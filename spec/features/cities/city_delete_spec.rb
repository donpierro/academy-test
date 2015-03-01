include Warden::Test::Helpers
Warden.test_mode!

# Feature: Delete city
#   As a user
#   I want to delete a city
feature 'Delete city', :devise do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:city) { FactoryGirl.create(:city) }

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Deletes city by user
  #   Given I am signed in
  #   When I visit the city index page
  #   And I click destroy button
  #   Then I delete city from database
  scenario 'user deletes city from database' do
    login_as(user, scope: :user)
    visit cities_path
    click_link('Destroy')
    expect(page).to have_content('City was successfully deleted')
  end
end
