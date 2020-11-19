# frozen_string_literal: true

class ComplexBuilding < Asset
  DEFAULTS = YAML.load_file(Rails.root.join('lib', 'data', 'complex_building_defaults.yml')).freeze
  store_accessor :settings, DEFAULTS.keys
end