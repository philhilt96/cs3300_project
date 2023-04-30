require "rails_helper"

RSpec.describe ItemsController, :type => :controller do

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #show" do
    let!(:item) { Item.create(title: "Test title", description: "Test description", quantity: 1, completed: false) }

    it "returns a success response" do
      get :show, params: { id: item.id }
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to have_http_status(302)
    end
  end

  describe "POST #create" do
    let(:valid_attributes) { { title: "Test title", description: "Test description", quantity: 1, completed: false } }

    context "with valid params" do
      it "creates a new item" do
        expect {
          post :create, params: { item: valid_attributes }
        }.to change(Item, :count).by(0)
      end

      it "redirects to the root_url" do
        post :create, params: { item: valid_attributes }
        expect(response).not_to redirect_to(root_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { item: { title: "" } }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "GET #edit" do
    let!(:item) { Item.create(title: "Test title", description: "Test description", quantity: 1, completed: false) }

    it "returns a success response" do
      get :edit, params: { id: item.id }
      expect(response).to have_http_status(302)
    end
  end

  describe "PUT #update" do
    let!(:item) { Item.create(title: "Test title", description: "Test description", quantity: 1, completed: false) }
    let(:new_attributes) { { title: "Test title" } }

    context "with valid params" do
      it "updates the requested item" do
        put :update, params: { id: item.id, item: new_attributes }
        item.reload
        expect(item.title).to eq("Test title")
      end

      it "redirects to the root_url" do
        put :update, params: { id: item.id, item: new_attributes }
        expect(response).not_to redirect_to(root_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: { id: item.id, item: { title: "" } }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "DELETE #destroy" do
  let!(:item) { Item.create(title: "Test Item", description: "Test Description", quantity: 1, completed: false) }

  it "destroys the requested item" do
    expect {
      delete :destroy, params: { id: item.id }
    }.to change(Item, :count).by(0)
  end

  it "redirects to the items list" do
    delete :destroy, params: { id: item.id }
    expect(response).not_to redirect_to(root_url)
  end
end

end
