require 'rails_helper'

RSpec.describe FindFoodsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # FindFood. As you add validations to FindFood, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { search_query: 'updated_search', num_results: 'updated_num_result' }
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FindFoodsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'POST #create' do
    let(:find_food) { FactoryGirl.create(:find_food) }
    context 'with valid params' do
      it 'updates the attributes with inputted params' do
        expect do
          post :create, { find_food: valid_attributes }, valid_session
        end.to change(FindFood, :count).by(1)
      end

      # it "creates a new FindFood" do
      #   expect {
      #     post :create, {find_food: valid_attributes}, valid_session
      #   }.to change(FindFood, :count).by(1)
      # end
      #
      # it "assigns a newly created find_food as @find_food" do
      #   post :create, {:find_food => valid_attributes}, valid_session
      #   expect(assigns(:find_food)).to be_a(FindFood)
      #   expect(assigns(:find_food)).to be_persisted
      # end

      it 'redirects to the created find_food' do
        post :create, { find_food: valid_attributes }, valid_session
        expect(response).to redirect_to(FindFood.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved find_food as @find_food' do
        post :create, { find_food: invalid_attributes }, valid_session
        expect(assigns(:find_food)).to be_a_new(FindFood)
      end

      it "re-renders the 'new' template" do
        post :create, { find_food: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'POST #food_info' do
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested find_food' do
        find_food = FindFood.create! valid_attributes
        put :update, { id: find_food.to_param, find_food: new_attributes }, valid_session
        find_food.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested find_food as @find_food' do
        find_food = FindFood.create! valid_attributes
        put :update, { id: find_food.to_param, find_food: valid_attributes }, valid_session
        expect(assigns(:find_food)).to eq(find_food)
      end

      it 'redirects to the find_food' do
        find_food = FindFood.create! valid_attributes
        put :update, { id: find_food.to_param, find_food: valid_attributes }, valid_session
        expect(response).to redirect_to(find_food)
      end
    end

    context 'with invalid params' do
      it 'assigns the find_food as @find_food' do
        find_food = FindFood.create! valid_attributes
        put :update, { id: find_food.to_param, find_food: invalid_attributes }, valid_session
        expect(assigns(:find_food)).to eq(find_food)
      end

      it "re-renders the 'edit' template" do
        find_food = FindFood.create! valid_attributes
        put :update, { id: find_food.to_param, find_food: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'GET #dashboard' do
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested find_food' do
      find_food = FindFood.create! valid_attributes
      expect do
        delete :destroy, { id: find_food.to_param }, valid_session
      end.to change(FindFood, :count).by(-1)
    end

    it 'redirects to the find_foods list' do
      find_food = FindFood.create! valid_attributes
      delete :destroy, { id: find_food.to_param }, valid_session
      expect(response).to redirect_to(find_foods_url)
    end
  end
end
