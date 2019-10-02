class Row < ApplicationRecord
  belongs_to :sudoku
  has_many :values
  accepts_nested_attributes_for :values, reject_if: :all_blank

  NVALUES = 9

  def self.generate(rows, index_y)
    current_row = []

    while current_row.empty? || current_row.include?(nil)
      (0..Row::NVALUES-1).each do |index_x|
        forbidden_elements = calculate_forbidden(rows, current_row,
                                                 index_x, index_y)
        if forbidden_elements.size == 9
          current_row = []
          break
        end
        element = Value.generate(forbidden_elements)
        current_row.push(element)
      end
    end

    current_row
  end

  def self.calculate_forbidden(rows, horizontal_row, index_x, index_y)
    return horizontal_row.compact.uniq if rows.empty?

    vertical_row = calculate_vertical_forbidden(rows, index_x)
    subsquare = calculate_subsquare_forbidden(rows, index_x, index_y)
    [vertical_row, horizontal_row, subsquare].flatten.compact.uniq
  end

  def self.calculate_vertical_forbidden(rows, index_x)
    rows.transpose[index_x]
  end

  def self.calculate_subsquare_forbidden(rows, index_x, index_y)
    subsquare = []
    case index_x
    when 0, 3, 6
      case index_y
      when 1, 4, 7
        subsquare = rows[index_y-1][index_x+1..index_x+2]
        subsquare.push(rows[index_y+1][index_x+1..index_x+2]) if rows.size > index_y
      when 2, 5, 8
        subsquare.push(rows[index_y-2][index_x+1..index_x+2])
        subsquare.push(rows[index_y-1][index_x+1..index_x+2])
      end
    when 1, 4, 7
      case index_y
      when 1, 4, 7
        subsquare.push(rows[index_y-1][index_x-1])
                 .push(rows[index_y-1][index_x+1])
        if rows.size > index_y
          subsquare.push((rows[index_y+1][index_x-1])
                   .push(rows[index_y+1][index_x+1]))
        end
      when 2, 5, 8
        subsquare.push(rows[index_y-2][index_x-1])
                 .push(rows[index_y-1][index_x-1])
                 .push(rows[index_y-2][index_x+1])
                 .push(rows[index_y-1][index_x+1])
      end
    when 2, 5, 8
      case index_y
      when 1, 4, 7
        subsquare.push(rows[index_y-1][index_x-2..index_x-1])
        subsquare.push(rows[index_y+1][index_x-2..index_x]-1) if rows.size > index_y
      when 2, 5, 8
        subsquare.push(rows[index_y-2][index_x-2..index_x-1])
        subsquare.push(rows[index_y-1][index_x-2..index_x-1])
      end
    else
      puts 'Error!'
    end

    subsquare.flatten
  end
end
