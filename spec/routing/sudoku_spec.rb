require 'rails_helper'

RSpec.describe Sudoku, type: :model do
  describe 'validations' do
    it do
      should validate_numericality_of(:ncolumns).
        only_integer.is_greater_than_or_equal_to(3)
    end
  end
end
