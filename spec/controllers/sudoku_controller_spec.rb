require 'rails_helper'

RSpec.describe SudokusController, type: :controller do
  before do
    @params = { 'sudoku' => { 'ncolumns' => 3 } }
  end

  describe 'GET #new' do
    it 'assigns @sudoku' do
      # get :new
      # expect(assigns(:sudoku)).to be_a_new(Sudoku)
    end

    it 'returns a success response' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    it 'assigns @sudoku' do
      expect(assigns(:sudoku)).to eq(Sudoku.last)
    end

    it 'creates a new Sudoku' do
      expect {
        post :create, params: @params
      }.to change(Sudoku, :count).by(1)
    end

    it 'redirects to the created sudoku' do
      post :create, params: @params
      expect(response).to redirect_to(Sudoku.last)
    end

    it 'returns a success response' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE #destroy' do
    before do
      post :create, params: @params
      @sudoku_id = Sudoku.last.id
      post :create, params: @params
      @last_sudoku_id = Sudoku.last.id
      delete :destroy, params: { 'id' => @last_sudoku_id }
    end

    it 'deletes a requested Sudoku' do
      expect(Sudoku.last.id).not_to eq(@last_sudoku_id)
    end

    it 'returns a success response' do
      expect(response).to have_http_status(:found)
    end

    it 'redirects to index' do
      expect(response).to redirect_to('/sudokus/new')
    end
  end
end
