# frozen_string_literal: true

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fill: [250, 250, 'Center']

  version :thumb do
    process resize_to_fill: [50, 50, 'Center']
  end

  def extension_allowlist
    %w[jpg jpeg png]
  end
end
