class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.references :group, null: false, foreign_key: true
      t.string :name
      t.string :status
      t.string :type
      t.datetime :start
      t.datetime :end
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
