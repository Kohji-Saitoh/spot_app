class ImageUploader < CarrierWave::Uploader::Base 
  include CarrierWave::MiniMagick
  process resize_to_fit: [400, 200]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_allowlist
    %w(jpg jpeg gif png)
  end

  version :thumb do 
    process resize_to_fit: [500, 500] 
  end 

  version :thumb50 do 
    process resize_to_fit: [100, 100] 
  end 
end