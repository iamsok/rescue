class Question < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 4}
  validates :description, presence: true, length: {minimum: 15}

  has_many :answers
end
