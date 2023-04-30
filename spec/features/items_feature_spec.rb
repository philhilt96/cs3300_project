require "rails_helper"

RSpec.feature "Items", type: :feature do
    context "Update item" do
      let(:item) { Item.create(title: "Test title", description: "Test content") }
      before(:each) do
        visit edit_item_path(item)
      end

      # scenario "should be successful" do
      #   within("form") do
      #     fill_in "Description", with: "New description content"
      #   end
      #   click_button "Update Item"
      #   expect(page).to have_content("Item was successfully updated")
      # end
    end
end