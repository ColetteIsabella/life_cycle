require 'spec_helper'

feature "Deleting fellows" do

  scenario "Deleting a fellow" do
    #let!(:fellow) { Factory(:fellow)}
    #let!(:user) { Factory(:confirmed_user)}


    #before do
    #sign_in_as!(:user)
    #click_link "New Guy"
    click_link "Delete Fellow"
    page.should have_content("Fellow has been deleted.")


    visit '/fellows'
    page.should_not have_content("New Guy")
  end
end
