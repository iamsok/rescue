class Answer < ActiveRecord::Base
  validates :description, presence: true, length: {minimum: 15}

  belongs_to :question
end
