class Reply < ActiveRecord::Base
  attr_accessible :body, :question_id

  belongs_to :user, :counter_cache => true
  belongs_to :question, :counter_cache => true

  validates_presence_of :question, :user, :body
end
