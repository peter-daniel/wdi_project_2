class Movie < ActiveRecord::Base
  belongs_to :user
  #lambda function for database manipulation
  scope :top_five, -> { where(:top5 => true) }

end
