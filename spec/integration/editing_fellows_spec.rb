require 'spec_helper'

feature "Editing Fellows" do
  #before do
    Factory(:fellow, name: "New Guy")
    visit '/fellows'

    click_link "Follower"
    click_link "Edit Fellow"
  end

  scenario "Updating a fellow" do
    fill_in "Name", with: "New Guy, Jr."
    click_button "Update Fellow"
    page.should have_content("Fellow has been updated.")
  end

  scenario "Updating a fellow with invalid attributes, don't do it" do
    fill_in "Name", with: ""
    click_button "Update Fellow"
    page.should have_content("Fellow has not been updated.")
  end
end
