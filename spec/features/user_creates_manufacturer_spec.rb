require "rails_helper"

# As a car salesperson
# I want to record a car manufacturer
# So that I can keep track of the types of cars found in the lot
#
# Acceptance Criteria:
#
# [X] I must specify a manufacturer name and country.
# [X] If I do not specify the required information, I am presented with errors.
# [X] If I specify the required information,
#     the manufacturer is recorded and
#     I am redirected to the index of manufacturers
# [X] Manufacturer name must be unique

feature "User adds a manufactuerer" do
  scenario "User successfully adds a manufacturer" do
    visit new_manufacturer_path

    fill_in "Name", with: "Chevy"
    fill_in "Country", with: "USA"

    click_on "Submit"

    expect(page).to have_content("Ford")
  end

  scenario "User leaves req'd fields blank" do
    visit new_manufacturer_path

    click_on "Submit"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Country can't be blank")
  end

  scenario "User tries to add an already existing manufacturer" do

    visit new_manufacturer_path

    FactoryGirl.build(:manufacturer)

    fill_in "Name", with: "Ford"
    fill_in "Country", with: "USA"

    click_on "Submit"

    expect(page).to have_content("Name has already been taken")
  end
end
