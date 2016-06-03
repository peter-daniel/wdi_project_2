class Movie < ActiveRecord::Base
  belongs_to :user
  
  scope :top_five, -> { where(:top5 => true) }

end
