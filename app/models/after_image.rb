class AfterImage < Asset
  has_attached_file :attachment
  validates_attachment :attachment,
                       :presence => true,
                       :content_type => { :content_type => %w(image/jpeg image/jpg image/png) }
end