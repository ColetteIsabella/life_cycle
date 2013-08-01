require 'spec_helper'

feature "Editing Statuses" do
  scenario "Updating a status" do
    Factory(:status, :name => "Follower")
    visit "/statuses"
    click_link "Follower"
    click_link "Edit Status"
    fill_in "Name", :with => "Default"
    click_button "Update Status"
    page.should have_content("Status has been updated.")
  end
end
