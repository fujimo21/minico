class CreateWatchlists < ActiveRecord::Migration
  def change
    create_table :watchlists do |t|
      t.references :user, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true

      t.timestamps null: false
      t.index [:user_id, :movie_id], unique: true
    end
  end
end
