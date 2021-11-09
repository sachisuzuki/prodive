class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.test?
    def cache_dir
      "#{Rails.root}/spec/support/uploads/tmp"
    end

    def store_dir
      "#{Rails.root}/spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  end

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :original, if: :is_image? do
    process resize_to_fill: [300, 200, 'Center']
  end

  version :thumb, if: :is_image? do
    process resize_to_fill: [250, 180, 'Center']
  end

  version :screenshot, if: :is_video? do
    process :screenshot
    def full_filename(_for_file = model.logo.file)
      'screenshot.jpg'
    end
  end

  def screenshot
    tmpfile = File.join(File.dirname(current_path), 'tmpfile')

    File.rename(current_path, tmpfile)

    movie = FFMPEG::Movie.new(tmpfile)
    movie.screenshot(current_path + '.jpg', { resolution: '300x200' }, preserve_aspect_ratio: :width)
    File.rename(current_path + '.jpg', current_path)
    file.content_type = 'image/jpeg'
    File.delete(tmpfile)
  end

  def extension_allowlist
    %w[jpg jpeg png MOV wmv mp4]
  end

  private

  def is_image?(image)
    image.content_type.include?('image/')
  end

  def is_video?(video)
    video.content_type.include?('video/')
  end
end
