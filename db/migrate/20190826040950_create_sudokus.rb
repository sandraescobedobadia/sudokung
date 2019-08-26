class CreateSudokus < ActiveRecord::Migration[6.0]
  def change
    create_table :sudokus do |t|
      t.integer :ncolumns

      t.timestamps
    end
  end
end
