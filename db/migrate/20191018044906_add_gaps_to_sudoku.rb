class AddGapsToSudoku < ActiveRecord::Migration[6.0]
  def up
    add_column :sudokus, :gaps, :string
  end

  def down
    remove_column :sudokus, :gaps
  end
end
