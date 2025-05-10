class ImageUploader < Shrine
  plugin :derivatives, create_on_promote: true
  plugin :derivation_endpoint, secret_key: Rails.application.secret_key_base
  plugin :determine_mime_type
  plugin :validation_helpers

  Attacher.validate do
    validate_max_size 5.megabytes, message: "is too large (max is 5 MB)"
    validate_mime_type_inclusion %w[image/jpeg image/png image/webp]
  end

  Attacher.derivatives_processor do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    {
      feed:  magick.resize_to_fill!(600, 600),
      show:  magick.resize_to_fill!(800, 800),
      thumb: magick.resize_to_fill!(150, 150)
    }
  end
end
