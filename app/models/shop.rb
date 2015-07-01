class Shop < ActiveRecord::Base
  belongs_to :user
  has_many :products, :dependent => :destroy

  validates_uniqueness_of :name

  delegate :slug, :to => :user

  def self.find_by_slug! slug
    User.find_by_slug!(slug).try(:shop)
  end

end
