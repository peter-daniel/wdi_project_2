class User < ActiveRecord::Base
  has_secure_password

  has_many :movies

  # scope :top_five, includes(:movies).where('user_id = ? AND top5 = ?', id, true)



end
