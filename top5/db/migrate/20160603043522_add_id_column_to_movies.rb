class AddIdColumnToMovies < ActiveRecord::Migration
  def change
        add_column :movies, :imdbID, :string
  end
end
