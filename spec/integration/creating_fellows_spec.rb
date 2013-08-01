require 'spec_helper'

feature 'Creating Fellows' do

  before do
    visit '/fellows'
      click_link 'New Fellow'
    end


  scenario "can create a fellow" do
    fill_in 'Name', with: 'New Guy'
    fill_in 'Email', with: "guy@example.com"
    fill_in 'Twitter', with: "@example"
    fill_in 'Facebook', with: "guy.fbook.com"
    fill_in 'LinkedIn', with: "guy.linkedin.com"
    fill_in 'Notes', with: "such a good guy"
    click_button 'Create Fellow'
    page.should have_content("Fellow has been added.")

    fellow = Fellow.find_by_name("New Guy")
    page.current_url.should == fellow_url(fellow)
    title = "New Guy - Fellows - life_cycle"
    find("title").should have_content(title)
  end

  scenario "can not create a fellow without a name" do
    click_button 'Create Fellow'
    page.should have_content("Fellow has not been added.")
    page.should have_content("Name can't be blank")
  end
end
