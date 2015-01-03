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
  @manufacturer = FactoryGirl.build(:manufacturer)

  scenario "User sucessfully adds a car" do

  end

end
