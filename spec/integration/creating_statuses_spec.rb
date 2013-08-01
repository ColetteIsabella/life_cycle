require 'spec_helper'

feature 'Creating Statuses' do
    visit '/statuses'
    click_link 'New Status'

    scenario "can create a status" do
    fill_in 'Name', :with => 'New Guy'
    click_button 'Create Status'
    page.should have_content('Status has been created.')

    status = Status.find_by_name("New Guy")
    page.current_url.should == status_url(status)
    title = "New Guy - Statuses - life_cycle"
    find("title").should have_content(title)

  end

  scenario "can not create a status without a name" do
    click_button 'Create Status'
    page.should have_content("Status has not been created.")
    page.should have_content("Name can't be blank")
  end
end
