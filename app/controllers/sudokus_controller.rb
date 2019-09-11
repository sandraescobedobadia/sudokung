class SudokusController < ApplicationController
  before_action :set_sudoku, only: [:show, :destroy]

  # GET /sudokus/1
  # GET /sudokus/1.json
  def show
  end

  # GET /sudokus/new
  def new
    @sudoku = Sudoku.new
    Sudoku::NROWS.times {
      row = @sudoku.rows.build
      Row::NVALUES.times { row.values.build }
    }
    @values = [
       [1, 2, 3, 4, 5, 6, 7, 8, 9],
       [1, 2, 3, 4, 5, 6, 7, 8, 9],
       [1, 2, 3, 4, 5, 6, 7, 8, 9],
       [1, 2, 3, 4, 5, 6, 7, 8, 9],
       [1, 2, 3, 4, 5, 6, 7, 8, 9],
       [1, 2, 3, 4, 5, 6, 7, 8, 9],
       [1, 2, 3, 4, 5, 6, 7, 8, 9],
       [1, 2, 3, 4, 5, 6, 7, 8, 9],
       [1, 2, 3, 4, 5, 6, 7, 8, 9],
     ]
  end

  # POST /sudokus
  # POST /sudokus.json
  def create
    @sudoku = Sudoku.new(sudoku_params)
    respond_to do |format|
      if @sudoku.save
        format.html { redirect_to @sudoku }
        format.json { render :show, status: :created, location: @sudoku }
      else
        format.html { render :new }
        format.json { render json: @sudoku.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sudokus/1
  # DELETE /sudokus/1.json
  def destroy
    @sudoku.destroy
    respond_to do |format|
      format.html { redirect_to new_sudoku_path }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sudoku
    @sudoku = Sudoku.find(params[:id])
  end

  def sudoku_params
    params.require(:sudoku)
          .permit(:id, :name, rows_attributes:
                  [:id, :index, :sudoku_id, values_attributes:
                    [:id, :number, :row_id]
                  ]
                )
  end
end
