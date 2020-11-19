# frozen_string_literal: true

class CommercialUnit < Asset
  DEFAULTS = YAML.load_file(Rails.root.join('lib', 'data', 'commercial_unit_defaults.yml')).freeze
  store_accessor :settings, DEFAULTS.keys
end