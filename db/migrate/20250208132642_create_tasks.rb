class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :done

      t.timestamps
    end
  end
end
