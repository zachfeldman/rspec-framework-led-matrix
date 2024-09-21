# frozen_string_literal: true

module RspecFrameworkLedMatrix
  module ImageGenerator
    def self.generate_image(statuses)
      width = 9
      height = 34

      passed_points = []
      pending_points = []

      statuses.each_with_index do |status, idx|
        x = idx % width
        y = idx / width

        case status
        when :passed
          passed_points << "point #{x},#{y}"
        when :pending
          pending_points << "point #{x},#{y}"
        end
        # Failed points remain black (background)
      end

      # Construct the draw parameters
      draw_params = []

      draw_params << "-fill gray10 -draw \"#{pending_points.join(" ")}\"" unless pending_points.empty?

      draw_params << "-fill white -draw \"#{passed_points.join(" ")}\"" unless passed_points.empty?

      # Build the ImageMagick convert command
      command = [
        "convert",
        "-size #{width}x#{height}",
        "xc:black",
        draw_params.join(" "),
        "output.png"
      ].join(" ")

      # Execute the command
      system(command)
    end
  end
end
