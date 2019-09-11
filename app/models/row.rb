class Row < ApplicationRecord
  belongs_to :sudoku
  has_many :values
  accepts_nested_attributes_for :values, reject_if: :all_blank

  NVALUES = 9
end
