# frozen_string_literal: true

class ImageUploader < Shrine
  SUPPORTED_MIME_TYPES = %w[image/jpeg image/gif image/png image/jpg].freeze

  Attacher.validate do
    validate_mime_type(SUPPORTED_MIME_TYPES)
  end

  # Fall back to the original file URL when the derivative
  # https://shrinerb.com/docs/processing#url-fallbacks
  Attacher.default_url do |derivative: nil, **|
    file&.url if derivative
  end


  def generate_location(io, record: nil, **context)
    derivative = context[:version].presence || context[:derivative]
    basename = basic_location(io, metadata: context[:metadata])

    [record&.class.to_s.pluralize.downcase, record&.id, derivative, basename].reject(&:blank?).join('/')
  end
end
