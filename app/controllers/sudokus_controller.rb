class SudokusController < ApplicationController
  before_action :set_sudoku, only: [:show, :edit, :update, :destroy]

  # GET /sudokus
  # GET /sudokus.json
  def index
    @sudokus = Sudoku.all
  end

  # GET /sudokus/1
  # GET /sudokus/1.json
  def show
  end

  # GET /sudokus/new
  def new
    @sudoku = Sudoku.new
  end

  # GET /sudokus/1/edit
  def edit
  end

  # POST /sudokus
  # POST /sudokus.json
  def create
    @sudoku = Sudoku.new(sudoku_params)

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

  # PATCH/PUT /sudokus/1
  # PATCH/PUT /sudokus/1.json
  def update
    respond_to do |format|
      if @sudoku.update(sudoku_params)
        format.html { redirect_to @sudoku, notice: 'Sudoku was successfully updated.' }
        format.json { render :show, status: :ok, location: @sudoku }
      else
        format.html { render :edit }
        format.json { render json: @sudoku.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sudokus/1
  # DELETE /sudokus/1.json
  def destroy
    @sudoku.destroy
    respond_to do |format|
      format.html { redirect_to sudokus_url, notice: 'Sudoku was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sudoku
      @sudoku = Sudoku.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sudoku_params
      params.require(:sudoku).permit(:ncolumns)
    end
end
