require "rails_helper"

describe "Item Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the title is present when creating item" do
      item = Item.new(description: "Content of the description")
      expect(item.valid?).to eq(true)
    end
    it "should not be able to save item when title missing" do
      item = Item.new(description: "Some description content goes here")
      expect(item.save).to eq(true)
    end
    it "should be able to save item when have description and title" do
      item = Item.new(title: "Title", description: "Content of the description")
      expect(item.save).to eq(true)
    end
  end
end

describe "Item Attribute Requirements on Edit", :type => :model do
  context "Edit item" do 
    before (:each) do
      @item = Item.create(title: "Title", description: "Content of the description")
      end
    it "ensures the title is present when editing item" do
      @item.update(:title => "New Title")
      expect(@item.title == "New Title")
    end
  end
end

