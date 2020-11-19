# frozen_string_literal: true

class VeryLongTaskService
  def self.call
    new.perform
  end

  def initialize; end

  def perform
    sleep 60
    true # the task was completed correctly
  end
end