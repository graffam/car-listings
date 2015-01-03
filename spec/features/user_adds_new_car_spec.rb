require "rails_helper"

# Acceptance Criteria:
#
# [] I must specify the manufacturer, color, year, and mileage of the car
# [] Only years from 1920 and above can be specified.
# [] I can optionally specify a description of the car.
# [] If I enter all of the required information in the required formats,
#    the car is recorded and I am presented with a notification of success.
# [] If I do not specify all of the required information in the required formats,
#    the car is not recorded and I am presented with errors.
# [] Upon successfully creating a car, I am redirected back to the index of cars.

context "there is a manufacturer in the database" do

  scenario "User sucessfully adds a car" do
    visit new_car_path

    fill_in "Name", with: "Corolla"
    fill_in "Year", with: "1920"
    fill_in "Color", with: "Blue"
    fill_in "Mileage", with: "20,000"
    select "Chevy", from: "manufacturer_name"

    click_on "Submit"

    expect(page).to have_content("Successfully added a Car")
  end

end
