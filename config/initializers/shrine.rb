# frozen_string_literal: true

require 'shrine'
require "shrine/storage/file_system"

storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent
}

Shrine.storages = storages

Shrine.plugin :model
Shrine.plugin :derivatives
Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files
Shrine.plugin :determine_mime_type
Shrine.plugin :default_url
Shrine.plugin :validation_helpers
