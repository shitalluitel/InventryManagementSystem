class CompanyProfile < ApplicationRecord
  mount_uploader :logo, LogoUploader #this is important to upload image
  #it links this model with logo uploader
  validates :vdc_mun, presence: true

  #line below is used to validate te size of the logo that wil be uploaded
  validates_processing_of :logo
  validate :photo_size_validation

  private
  def photo_size_validation
    errors[:logo] << "should be less than 1MB" if logo.size > 1.megabytes
  end
end
