class Sudoku < ApplicationRecord
  has_many :rows
  accepts_nested_attributes_for :rows, reject_if: :all_blank

  NROWS = 9

  def self.generate
    rows = []
    (0..NROWS-1).each do |index|
      new_row = Row.generate(rows, index)
      rows.push(new_row)
    end

    rows
  end

  def get_square(x, y)
    x = x * 3
    y = y * 3
    selected_rows = self.rows.to_a[x..(x + 2)]
    selected_rows.map! { |row| row.values.to_a[y..(y + 2)] }
    selected_rows.collect! do |values_row|
      values_row.collect! { |value| value.number }
    end
  end

  def self.generate_gaps(amount = 36)
    gaps = ''
    (1..(NROWS * Row::NVALUES)).each do |row|
      if row % 3 == 0 && two_gaps_in_square_row?(gaps)
        gaps += '1'
      else
        gaps += ['0', '1'].sample
      end
    end

    gaps
  end

  def self.two_gaps_in_square_row?(gaps)
    return true if gaps[-1] == gaps[-2] && gaps[-1] == '0'

    false
  end

  def self.calculate_subgaps(gaps, x, y)
    start_index = 0
    if x == 1
      start_index = 27
    elsif x == 2
      start_index = 54
    end

    [gaps[start_index..start_index + 2].split(''),
     gaps[start_index + 3..start_index + 5].split(''),
     gaps[start_index + 6..start_index + 8].split('')]
  end
end
