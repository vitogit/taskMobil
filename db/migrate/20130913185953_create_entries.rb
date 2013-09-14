class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.float :hours
      t.datetime :date
      t.string :category
      t.string :comment
      t.integer :task_id

      t.timestamps
    end
  end
end
