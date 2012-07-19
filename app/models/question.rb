class Question < ActiveRecord::Base
  attr_readonly :user_id
  attr_accessible :title, :body, :category_id

  belongs_to :user, :counter_cache => true
  belongs_to :category, :counter_cache => true
  has_many :replies, :dependent => :destroy

  scope :recent, order("id desc")
  scope :unanswered, where(:replies_count => 0)
  scope :to_feed, includes(:user).limit(10).order("id desc")

  validates_presence_of :title, :body, :category, :user

  define_index do
    set_property :delta => true

    indexes title
    indexes body
  end

  def viewed!
    increment!(:views_count)
  end
end
