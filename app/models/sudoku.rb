class Sudoku < ApplicationRecord
  has_many :rows
  accepts_nested_attributes_for :rows, reject_if: :all_blank

  NROWS = 9
end
