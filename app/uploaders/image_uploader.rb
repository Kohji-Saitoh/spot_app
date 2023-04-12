class ImageUploader < CarrierWave::Uploader::Base 
  include CarrierWave::MiniMagick
  process resize_to_fit: [400, 200]

  #アップロードした画像の表示
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  #デフォルト画像の設定
  def default_url
    "default.png"←デフォルト画像に設定したい画像名を記入
  end

  def extension_allowlist
    %w(jpg jpeg gif png)
  end
end