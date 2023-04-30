RSpec.feature "HomePages", type: :feature do

    scenario "The visitor should see items" do
  
      visit root_path
  
      expect(page).to have_text("Shopping List")
  
    end
  
  end