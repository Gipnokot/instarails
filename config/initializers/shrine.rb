require "shrine"
require "shrine/storage/file_system"
require "shrine/plugins/download_endpoint"


Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store")
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
Shrine.plugin :derivatives, create_on_upload: true
Shrine.plugin :derivation_endpoint,
  secret_key: Rails.application.secret_key_base,
  prefix: "derivations"
Shrine.plugin :determine_mime_type
Shrine.plugin :pretty_location
