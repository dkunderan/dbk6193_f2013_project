class CreateAmazoncards < ActiveRecord::Migration
  def change
    create_table :amazoncards do |t|
      t.string :code
      t.integer :used

      t.timestamps
    end
  end
end
