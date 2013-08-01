require 'spec_helper'

feature "Creating fellow statuses" do
  before do
    Factory(:status, name: "A Status")
    Factory(:fellow, :name => "Other Guy")
    let!(:user) { Factory(:confirmed_user) }
    let!(:fellowstatus) do
    user = Factory(:user, :email => "guy@example.com")
    sign_in_as!(user)
  end


    visit '/'
    click_link "Other Guy"
    click_link "New Fellow Status"
      message = "You need to sign in or sign up before continuing."
    page.should have_content(message)

    fill_in "Email", :with => "guy@example.com"
    fill_in "Password", :with => "password"
    click_button "Sign in"
    within("h2") { page.should have_content("New Guy")}
  end



    scenario "can create a fellow status" do
      select("New Guy", from: "Choose a Fellow!")
      select("A Status", from: "Set a Status!")
      click_link "Create Fellowstatus"
      page.should have_content "Fellow Status has been created."
        within("#fellowstatus #author") do
      page.should have_content("Added by guy@example.com")
    end
  end
end

