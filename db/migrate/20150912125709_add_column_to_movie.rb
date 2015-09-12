class AddColumnToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :poster_path, :string
    add_column :movies, :tmdb_id, :string
  end
end
