require "rails_helper"

# Acceptance Criteria:
#
# [X] I must specify the manufacturer, color, year, and mileage of the car
# [X] Only years from 1920 and above can be specified.
# [X] I can optionally specify a description of the car.
# [X] If I enter all of the required information in the required formats,
#     the car is recorded and I am presented with a notification of success.
# [X] If I do not specify all of the required information
#     in the required formats, the car is not recorded and
#     I am presented with errors.
# [X] Upon successfully creating a car,
#     I am redirected back to the index of cars.

context "there is a manufacturer in the database" do

  before do
    @manufacturer = FactoryGirl.create(:manufacturer)
  end

  scenario "User sucessfully adds a car" do

    visit new_car_path

    select @manufacturer.name, from: "car_manufacturer_id"
    fill_in "Name", with: "Corolla"
    fill_in "Year", with: "1920"
    fill_in "Color", with: "Blue"
    fill_in "Mileage", with: "20,000"

    click_on "Submit"

    expect(page).to have_content("Successfully added a Car")
  end

  scenario "User does not fill in req'd fields" do

    visit new_car_path

    click_on "Submit"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Year can't be blank")
    expect(page).to have_content("Color can't be blank")
    expect(page).to have_content("Mileage can't be blank")
  end

  scenario "User enter year with value below 1920" do

    visit new_car_path

    select @manufacturer.name, from: "car_manufacturer_id"
    fill_in "Name", with: "Corolla"
    fill_in "Year", with: "1919"
    fill_in "Color", with: "Blue"
    fill_in "Mileage", with: "20,000"

    click_on "Submit"

    expect(page).to have_content("Year must be greater than 1919")
  end

end
