class Effect < ActiveRecord::Base
  belongs_to :product
  has_one :before_image, :as => :attachable, :class_name => 'BeforeImage', :dependent => :destroy
  has_one :after_image, :as => :attachable, :class_name => 'AfterImage', :dependent => :destroy
  acts_as_list :scope => :product
end
