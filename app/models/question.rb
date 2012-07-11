class Question < ActiveRecord::Base
  attr_readonly :user_id
  attr_accessible :title, :body, :category_id

  belongs_to :user
  belongs_to :category
  has_many :replies

  validates_presence_of :title, :body, :category, :user
end
