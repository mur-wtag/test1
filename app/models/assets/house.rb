# frozen_string_literal: true

class House < Asset
  DEFAULTS = YAML.load_file(Rails.root.join('lib', 'data', 'house_defaults.yml')).freeze
  store_accessor :settings, DEFAULTS.keys
end