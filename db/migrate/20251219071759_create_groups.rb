class CreateGroups < ActiveRecord::Migration[8.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :username
      t.string :type
      t.string :location
      t.string :website
      t.text :description

      t.timestamps
    end
  end
end
