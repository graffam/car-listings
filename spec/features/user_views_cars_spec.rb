require "rails_helper"
# As a user,
# I want to be able to view all of the cars in the system,
# so that I may see what is currently available.

# Acceptance Criteria:
# [X] I must see a list of all the cars when I visit cars index
# [] When I visit the details of a cars, I see the details

feature "user is able to view all of the cars" do

  context "There is a car in the database" do
    before do
      @car = FactoryGirl.create(:car)
    end

    scenario "user goes to the cars listing page" do
      visit cars_path

      expect(page).to have_content(@car.name)
    end

    scenario "User views the cars details" do
      visit cars_path

      click_on @car.name
      
      expect(page).to have_content("This is a lovely car")
    end
  end
end
