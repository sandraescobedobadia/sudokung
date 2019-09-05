class CreateValue < ActiveRecord::Migration[6.0]
  def up
    create_table :values do |t|
      t.integer  :number
      t.belongs_to :row

      t.timestamps
    end
  end

  def down
    drop_table :values
  end
end
