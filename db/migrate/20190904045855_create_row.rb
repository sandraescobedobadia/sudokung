class CreateRow < ActiveRecord::Migration[6.0]
  def up
    create_table :rows do |t|
      t.belongs_to :sudoku

      t.timestamps
    end
  end

  def down
    drop_table :rows
  end
end
