class CreateSudoku < ActiveRecord::Migration[6.0]
  def up
    create_table :sudokus do |t|

      t.timestamps
    end
  end

  def down
    drop_table :sudokus
  end
end
