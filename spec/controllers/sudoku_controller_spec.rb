require 'rails_helper'

RSpec.describe SudokusController, type: :controller do
  describe 'GET #new' do
    before do
      get :new
    end

    it 'returns a success response' do
      expect(response).to have_http_status(200)
    end

    it 'assigns @sudoku' do
      expect(assigns(:sudoku)).to be_a_new(Sudoku)
    end

    it 'assigns @values to Array' do
      expect(assigns(:values)).to be_kind_of(Array)
    end

    it '@values size is NROWS' do
      expect(assigns(:values).size).to be_equal(Sudoku::NROWS)
    end

    it '@rows are differents' do
      expect(assigns(:values).uniq).to match_array(assigns(:values))
    end

    it '@values are differents' do
      differents = true
      (0..8).each do |index|
        differents = false if assigns(:values)[index].uniq != assigns(:values)[index]
      end
      expect(differents).to be true
    end

  end

  describe 'POST #create' do
    before do
      @params =
        { 'sudoku' =>
          { "rows_attributes" =>
            { "0" => {"values_attributes" => {"0" => {"number" => "1"}, "1" => {"number" => "2"}, "2" => {"number" => "3"}, "3" => {"number" => "4"}, "4" => {"number" => "5"}, "5" => {"number" => "6"}, "6" => {"number" => "7"}, "7" => {"number" => "8"}, "8" => {"number" => "9"}}},
              "1" => {"values_attributes" => {"0" => {"number" => "1"}, "1" => {"number" => "2"}, "2" => {"number" => "3"}, "3" => {"number" => "4"}, "4" => {"number" => "5"}, "5" => {"number" => "6"}, "6" => {"number" => "7"}, "7" => {"number" => "8"}, "8" => {"number" => "9"}}},
              "2" => {"values_attributes" => {"0" => {"number" => "1"}, "1" => {"number" => "2"}, "2" => {"number" => "3"}, "3" => {"number" => "4"}, "4" => {"number" => "5"}, "5" => {"number" => "6"}, "6" => {"number" => "7"}, "7" => {"number" => "8"}, "8" => {"number" => "9"}}},
              "3" => {"values_attributes" => {"0" => {"number" => "1"}, "1" => {"number" => "2"}, "2" => {"number" => "3"}, "3" => {"number" => "4"}, "4" => {"number" => "5"}, "5" => {"number" => "6"}, "6" => {"number" => "7"}, "7" => {"number" => "8"}, "8" => {"number" => "9"}}},
              "4" => {"values_attributes" => {"0" => {"number" => "1"}, "1" => {"number" => "2"}, "2" => {"number" => "3"}, "3" => {"number" => "4"}, "4" => {"number" => "5"}, "5" => {"number" => "6"}, "6" => {"number" => "7"}, "7" => {"number" => "8"}, "8" => {"number" => "9"}}},
              "5" => {"values_attributes" => {"0" => {"number" => "1"}, "1" => {"number" => "2"}, "2" => {"number" => "3"}, "3" => {"number" => "4"}, "4" => {"number" => "5"}, "5" => {"number" => "6"}, "6" => {"number" => "7"}, "7" => {"number" => "8"}, "8" => {"number" => "9"}}},
              "6" => {"values_attributes" => {"0" => {"number" => "1"}, "1" => {"number" => "2"}, "2" => {"number" => "3"}, "3" => {"number" => "4"}, "4" => {"number" => "5"}, "5" => {"number" => "6"}, "6" => {"number" => "7"}, "7" => {"number" => "8"}, "8" => {"number" => "9"}}},
              "7" => {"values_attributes" => {"0" => {"number" => "1"}, "1" => {"number" => "2"}, "2" => {"number" => "3"}, "3" => {"number" => "4"}, "4" => {"number" => "5"}, "5" => {"number" => "6"}, "6" => {"number" => "7"}, "7" => {"number" => "8"}, "8" => {"number" => "9"}}},
              "8" => {"values_attributes" => {"0" => {"number" => "1"}, "1" => {"number" => "2"}, "2" => {"number" => "3"}, "3" => {"number" => "4"}, "4" => {"number" => "5"}, "5" => {"number" => "6"}, "6" => {"number" => "7"}, "7" => {"number" => "8"}, "8" => {"number" => "9"}}}
            }
          }
        }
    end

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
      @params =
        { 'sudoku' =>
          { "rows_attributes" =>
            { "0" => {"values_attributes" => {"0" => {"number" => "1"}, "1" => {"number" => "2"}, "2" => {"number" => "3"}, "3" => {"number" => "4"}, "4" => {"number" => "5"}, "5" => {"number" => "6"}, "6" => {"number" => "7"}, "7" => {"number" => "8"}, "8" => {"number" => "9"}}},
              "1" => {"values_attributes" => {"0" => {"number" => "1"}, "1" => {"number" => "2"}, "2" => {"number" => "3"}, "3" => {"number" => "4"}, "4" => {"number" => "5"}, "5" => {"number" => "6"}, "6" => {"number" => "7"}, "7" => {"number" => "8"}, "8" => {"number" => "9"}}},
              "2" => {"values_attributes" => {"0" => {"number" => "1"}, "1" => {"number" => "2"}, "2" => {"number" => "3"}, "3" => {"number" => "4"}, "4" => {"number" => "5"}, "5" => {"number" => "6"}, "6" => {"number" => "7"}, "7" => {"number" => "8"}, "8" => {"number" => "9"}}},
              "3" => {"values_attributes" => {"0" => {"number" => "1"}, "1" => {"number" => "2"}, "2" => {"number" => "3"}, "3" => {"number" => "4"}, "4" => {"number" => "5"}, "5" => {"number" => "6"}, "6" => {"number" => "7"}, "7" => {"number" => "8"}, "8" => {"number" => "9"}}},
              "4" => {"values_attributes" => {"0" => {"number" => "1"}, "1" => {"number" => "2"}, "2" => {"number" => "3"}, "3" => {"number" => "4"}, "4" => {"number" => "5"}, "5" => {"number" => "6"}, "6" => {"number" => "7"}, "7" => {"number" => "8"}, "8" => {"number" => "9"}}},
              "5" => {"values_attributes" => {"0" => {"number" => "1"}, "1" => {"number" => "2"}, "2" => {"number" => "3"}, "3" => {"number" => "4"}, "4" => {"number" => "5"}, "5" => {"number" => "6"}, "6" => {"number" => "7"}, "7" => {"number" => "8"}, "8" => {"number" => "9"}}},
              "6" => {"values_attributes" => {"0" => {"number" => "1"}, "1" => {"number" => "2"}, "2" => {"number" => "3"}, "3" => {"number" => "4"}, "4" => {"number" => "5"}, "5" => {"number" => "6"}, "6" => {"number" => "7"}, "7" => {"number" => "8"}, "8" => {"number" => "9"}}},
              "7" => {"values_attributes" => {"0" => {"number" => "1"}, "1" => {"number" => "2"}, "2" => {"number" => "3"}, "3" => {"number" => "4"}, "4" => {"number" => "5"}, "5" => {"number" => "6"}, "6" => {"number" => "7"}, "7" => {"number" => "8"}, "8" => {"number" => "9"}}},
              "8" => {"values_attributes" => {"0" => {"number" => "1"}, "1" => {"number" => "2"}, "2" => {"number" => "3"}, "3" => {"number" => "4"}, "4" => {"number" => "5"}, "5" => {"number" => "6"}, "6" => {"number" => "7"}, "7" => {"number" => "8"}, "8" => {"number" => "9"}}}
            }
          }
        }
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
