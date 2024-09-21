# frozen_string_literal: true

# lib/rspec-framework-led-matrix.rb

require "rspec-framework-led-matrix/image_generator"
require "rspec/status_listener"

module RspecFrameworkLedMatrix
  # Hook into RSpec configuration when the gem is loaded
  if defined?(RSpec)
    RSpec.configure do |config|
      # Register the listener with RSpec
      listener = StatusListener.new
      config.reporter.register_listener(
        listener,
        :example_passed,
        :example_failed,
        :example_pending
      )
    end
  end
end
