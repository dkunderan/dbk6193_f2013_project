class CreateAmazonGiftCards < ActiveRecord::Migration
  def change
    create_table :amazon_gift_cards do |t|
      t.string :code
      t.integer :used

      t.timestamps
    end
  end
end
