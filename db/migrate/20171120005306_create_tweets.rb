class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.text :text
      t.integer :user_id
      t.string :image
      t.string :link
      t.timestamps
    end
  end
end
