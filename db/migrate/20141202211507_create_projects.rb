class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :owner_id
      t.string :title
      t.text :description
      t.int :goal
      t.datetime :start_date
      t.datetime :finish_date

      t.timestamps
    end
  end
end
