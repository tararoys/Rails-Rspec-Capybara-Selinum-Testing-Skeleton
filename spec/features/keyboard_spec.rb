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
  
  context "Get /keyboards/1 check if selinium integration is working" do
    it "displays a keyboard" do
      keyboard = Keyboard.create(instrument_type: "piano")
      #this test needs a full rewrite to work in our keyboards context.  This is a good entry point for test driven development
      visit keyboard_path(keyboard)
      # save_and_open_page
      page.should have_content("piano")
    end
  end
end