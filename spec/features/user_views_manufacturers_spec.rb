require "rails_helper"

# Acceptance Criteria:
# [X] I must see a list of all the manufacturers when I visit manufacturers
# [X] When I visit the details of a manufacturer, I see the details

context "There is a manufacturer in the DB" do
  before do
    @manufacturer = FactoryGirl.create(:manufacturer)
  end

  scenario "User sees listing of manufacturers" do
    visit manufacturers_path

    expect(page).to have_content(@manufacturer.name)
  end

  scenario "User visits the details of the manufacturer" do
    visit manufacturers_path

    click_on @manufacturer.name

    expect(page).to have_content(@manufacturer.name)
    expect(page).to have_content(@manufacturer.country)
  end
end
