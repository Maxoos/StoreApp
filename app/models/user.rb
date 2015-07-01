class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  is_sluggable :user_name, :history => false, :slug_column => :slug

  has_one :shop, :dependent => :destroy

  before_create :build_default_shop

  validates_uniqueness_of :user_name
  validates_length_of :user_name, :minimum => 3, :maximum => 40
  validates_exclusion_of :user_name, :in => %w( c api account), :message => "This user name is taken"

  private

  def build_default_shop
    build_shop
    true
  end

end
