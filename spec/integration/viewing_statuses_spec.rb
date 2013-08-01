require "spec_helper"

feature "Viewing Statuses" do

  scenario "Listing all statuses" do
    status = Factory.create(:status, :name => "Follower")
    visit "/statuses"
    click_link "Follower"
    page.current_url.should == status_url(status)
  end
end

