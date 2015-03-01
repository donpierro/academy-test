module CitiesFeaturesHelper
  def create_city(name, short_name)
    visit new_city_path
    fill_in 'Name', with: name
    fill_in 'Short name', with: short_name
    click_button('Save')
  end
end

RSpec.configure do |config|
  config.include CitiesFeaturesHelper, type: :feature
end
