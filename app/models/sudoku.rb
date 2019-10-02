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
    rows.each { |row| puts(row.inspect) }

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
end
