require 'spec_helper'

feature "Viewing fellows" do

  scenario "Listing all fellows" do
    fellow = Factory.create(:fellow, name: "New Guy")
    visit '/fellows'
    click_link 'New Guy'
    page.current_url.should == fellow_url(fellow)
  end
end
