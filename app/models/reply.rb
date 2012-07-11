class Reply < ActiveRecord::Base
  attr_accessible :body, :question_id

  belongs_to :user
  belongs_to :question

  validates_presence_of :question, :user, :body
end
