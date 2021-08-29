class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :original, if: :is_image? do
    process resize_to_fill: [300, 300, "Center"]
  end

  version :thumb, if: :is_image? do
    process resize_to_fill: [250, 250, "Center"]
  end

  def extension_allowlist
    %w(jpg jpeg png mp4)
  end

  private
  def is_image? image
    image.content_type.include?('image/')
  end
end
