class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :director
      t.string :year
      t.string :actors
      t.boolean :top5
      #makes the forign key
      t.references :user
      t.timestamps null: false
    end
  end
end
