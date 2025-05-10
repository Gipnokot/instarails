require "shrine"
require "shrine/storage/file_system"
require "shrine/plugins/download_endpoint"


Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store")
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data     # для восстановления при ошибках валидации
Shrine.plugin :restore_cached_data        # заново подтягивает метаданные
Shrine.plugin :derivatives, create_on_upload: true            # генерируем thumb, large
Shrine.plugin :derivation_endpoint,
  secret_key: Rails.application.secret_key_base,
  prefix: "derivations" # тогда путь будет /derivations/...
Shrine.plugin :determine_mime_type
Shrine.plugin :pretty_location
