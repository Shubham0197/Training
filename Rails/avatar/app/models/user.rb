class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  validates_processing_of :avatar
  validate :image_size_validation
 
  private
    def image_size_validation
      errors[:avatar] << "should be less than 500KB" if avatar.size > 5.megabytes
    end
end
