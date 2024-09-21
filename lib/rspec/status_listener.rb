# frozen_string_literal: true

# lib/rspec-status-image/rspec/example_status_listener.rb

require_relative "../rspec-framework-led-matrix/image_generator"

module RspecFrameworkLedMatrix
  class StatusListener
    attr_reader :statuses

    def initialize
      @statuses = []
    end

    RSpec::Core::Formatters.register self, :example_passed, :example_failed, :example_pending

    def example_passed(_notification)
      @statuses << :passed
      after_example
    end

    def example_failed(_notification)
      @statuses << :failed
      after_example
    end

    def example_pending(_notification)
      @statuses << :pending
      after_example
    end

    private

    def after_example
      # Generate the image with the current statuses
      ImageGenerator.generate_image(@statuses)

      gem_spec = Gem.loaded_specs["rspec-framework-led-matrix"]
      gem_root = gem_spec.full_gem_path

      # Construct the path to the binary
      binary_path = File.join(gem_root, "bin", "inputmodule-control_cli_linux")

      # Execute the binary to show the image on the LED matrix
      system("sudo #{binary_path} led-matrix --image-gray output.png")
    end
  end
end
