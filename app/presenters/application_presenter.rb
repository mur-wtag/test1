# frozen_string_literal: true

class ApplicationPresenter
  def initialize(object, template)
    @object = object
    @template = template
  end

  def define_objects(objects_hash)
    objects_hash.each do |name, obj|
      define_singleton_method(name) do
        obj
      end
    end
  end

  private

  def self.presents(name)
    define_method(name) do
      @object
    end
  end

  def h
    @template
  end
end
