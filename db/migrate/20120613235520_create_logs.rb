class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :name
      t.integer :guid
      t.string :description

      t.timestamps
    end
  end
end
