class Question < ActiveRecord::Base
  attr_readonly :user_id
  attr_accessible :title, :body, :category_id

  belongs_to :user, :counter_cache => true
  belongs_to :category, :counter_cache => true 
  has_many :replies

  scope :recent, order("id desc")
  scope :unanswered, where(:replies_count => 0)


  validates_presence_of :title, :body, :category, :user
end
