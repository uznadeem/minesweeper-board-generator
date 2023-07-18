require 'rails_helper'

# spec/controllers/boards_controller_spec.rb

RSpec.describe BoardsController, type: :controller do
  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new board and redirects to the show page" do
        post :create, params: { board: { email: "test@example.com", name: "Test Board", width: 5, height: 5, mines: 5 } }
        expect(response).to redirect_to(assigns(:board))
        expect(Board.count).to eq(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new board and renders the new template with an error message" do
        post :create, params: { board: { email: "test@example.com", name: "Test Board", width: 5, height: 5, mines: 30 } }
        expect(response).to render_template(:new)
        expect(Board.count).to eq(0)
        expect(flash[:alert]).to be_present
      end
    end
  end
end

