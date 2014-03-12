require 'spec_helper'

feature 'Developer testing if testing setup works' do

 context "GET /tasks to check if capybara is working" do
    it "displays keyboards" do
      visit keyboards_path
      page.should have_content("hey")
    end
    
    it "supports js see if we can use capybara to test javascript methods", :js => true do
      visit keyboards_path
      click_link "test js"
      page.should have_content("js works")
    end
  end
  
  context "POST /tasks check if database cleaner is working" do
    xit "creates task" do
      #this test needs a full rewrite to work in our keyboards context.  This is a good entry point for test driven development
      visit keyboards_path
      fill_in "New Task", :with => "mow lawn"
      click_button "Add"
      # save_and_open_page
      page.should have_content("Successfully added task.")
      page.should have_content("mow lawn")
    end
  end
end