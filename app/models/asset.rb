# frozen_string_literal: true

class Asset < ApplicationRecord
  TYPES = %w[house complex_building commercial_unit].freeze
  validates :type, :owner, :address, :rooms, :sqmt, :price, presence: true
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1_000_000 }

  include ImageUploader::Attachment(:image)

  before_save :delete_image_if_marked
  attr_accessor :delete_image

  def to_s
    "#{type.humanize} owned by #{owner}"
  end

  def safe_setting(setting_name)
    value = settings[setting_name.to_s]
    defaults = House::DEFAULTS.merge(CommercialUnit::DEFAULTS, ComplexBuilding::DEFAULTS)

    # if `boolean` typed data
    if defaults.dig(setting_name.to_s, 'type').to_s.casecmp('boolean').zero?
      return defaults.dig(setting_name.to_s, 'default') if value.to_s.blank?

      value.to_s.casecmp('true').zero? || value == '1'
    else
      value.presence || defaults.dig(setting_name.to_s, 'default')
    end
  end

  private

  def delete_image_if_marked
    self.image = nil if @delete_image == '1'
  end
end
