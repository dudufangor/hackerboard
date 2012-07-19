class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :questions, :dependent => :destroy

  validates_presence_of :name

  scope :sorted_by_name, order("name asc")

  default_scope where(:deleted_at => nil)

  def self.to_be_removed
    unscoped.where("deleted_at is not null")
  end

  def remove!
    update_attribute :deleted_at, Time.now
  end
end
