class RemoveNcolumnsFromSudoku < ActiveRecord::Migration[6.0]
  def up
    remove_column :sudokus, :ncolumns, :integer
  end

  def down
    add_column :sudokus, :ncolumn, :integer
  end
end
