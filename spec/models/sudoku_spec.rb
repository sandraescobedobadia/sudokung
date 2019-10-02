require 'rails_helper'

RSpec.describe Sudoku, type: :model do
  before(:all) do
    @sudoku = Sudoku.generate
  end

  context 'generate a new sudoku' do
    let(:n_columns) { 9 }

    it 'it has 9 rows' do
      expect(@sudoku.size).to eq(n_columns)
    end

    it 'it has 9 columns' do
      columns = (0..(@sudoku.size-1)).count { |index| @sudoku[index].size == n_columns }
      expect(columns).to eq(@sudoku.size)
    end

    it 'it column values are differents' do
      repeat = @sudoku.transpose.reject do |column|
        column.size == column.uniq.size
      end
      expect(repeat).to be_empty
    end

    it 'subsquare values are differents' do
      subsquares = []
      (0..9).each { |index| subsquares[index] = [] }
      @sudoku[0..2].each do |row|
        subsquares[0].push(row[0..2])
        subsquares[1].push(row[3..5])
        subsquares[2].push(row[6..8])
      end
      subsquares[0] = subsquares[0].flatten
      subsquares[1] = subsquares[1].flatten
      subsquares[2] = subsquares[2].flatten
      @sudoku[3..5].each do |row|
        subsquares[3].push(row[0..2])
        subsquares[4].push(row[3..5])
        subsquares[5].push(row[6..8])
      end
      subsquares[3] = subsquares[3].flatten
      subsquares[4] = subsquares[4].flatten
      subsquares[5] = subsquares[5].flatten
      @sudoku[6..8].each do |row|
        subsquares[6].push(row[0..2])
        subsquares[7].push(row[3..5])
        subsquares[8].push(row[6..8])
      end
      subsquares[6] = subsquares[6].flatten
      subsquares[7] = subsquares[7].flatten
      subsquares[8] = subsquares[8].flatten
      repeat = 0
      subsquares.each do |subsquare|
        repeat += 1 if subsquare.uniq.size < subsquare.size
      end
      expect(repeat).to eq(0)
    end
  end
end
