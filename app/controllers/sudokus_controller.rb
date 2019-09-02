class SudokusController < ApplicationController
  before_action :set_sudoku, only: [:show, :edit, :destroy]

  # GET /sudokus/1
  # GET /sudokus/1.json
  def show
  end

  # GET /sudokus/new
  def new
    @sudoku = Sudoku.new
  end

  # POST /sudokus
  # POST /sudokus.json
  def create
    @sudoku = Sudoku.new
    respond_to do |format|
      if @sudoku.save
        format.html { redirect_to @sudoku, notice: 'Sudoku was successfully created.' }
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
      format.html { redirect_to new_sudoku_path, notice: 'Sudoku was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sudoku
      @sudoku = Sudoku.find(params[:id])
    end
end
