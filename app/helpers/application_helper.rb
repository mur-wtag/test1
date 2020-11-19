# frozen_string_literal: true

module ApplicationHelper
  def present(klass = nil, object:, **objects)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    presenter.define_objects(objects)
    yield(presenter) if block_given?
    presenter
  end
end
